# frozen_string_literal: true

RSpec.describe RubyJard::Inspectors::Base do
  subject(:inspector) { described_class.new }

  context 'with #inline' do
    let(:line_limit) { 80 }

    it {
      expect(inspector.inline(true, line_limit: line_limit)).to match_row(<<~SPANS)
        true
      SPANS
    }

    it {
      expect(inspector.inline(false, line_limit: line_limit)).to match_row(<<~SPANS)
        false
      SPANS
    }

    it {
      expect(inspector.inline(12_345, line_limit: line_limit)).to match_row(<<~SPANS)
        12345
      SPANS
    }

    it {
      expect(inspector.inline(123.456, line_limit: line_limit)).to match_row(<<~SPANS)
        123.456
      SPANS
    }

    it {
      expect(inspector.inline((123 + 0i), line_limit: line_limit)).to match_row(<<~SPANS)
        (123+0i)
      SPANS
    }

    it {
      expect(inspector.inline(/abcdef.*[a-z0-9]+/i, line_limit: line_limit)).to match_row(<<~SPANS)
        /abcdef.*[a-z0-9]+/i
      SPANS
    }

    it {
      expect(inspector.inline(method(:inspector).to_proc, line_limit: line_limit)).to match_row(<<~SPANS)
        #<Proc:?????????????????? (lambda)>
      SPANS
    }

    it {
      expect(
        inspector.inline(
          123_345_789_123_345_789_123_345_789_123_345_789_123_345_789_123_345_789_123_345_789_123_345_789_123_345_789,
          line_limit: line_limit
        )
      ).to match_row(<<~SPANS)
        1233457891233457891233457891233457891233457891233457891233457891233457891233457…
      SPANS
    }

    it {
      expect(
        inspector.inline(Object, line_limit: line_limit)
      ).to match_row(<<~SPANS)
        Object
      SPANS
    }

    it {
      expect(
        inspector.inline(:some_thing, line_limit: line_limit)
      ).to match_row(<<~SPANS)
        :some_thing
      SPANS
    }

    it {
      expect(
        inspector.inline(nil, line_limit: line_limit)
      ).to match_row(<<~SPANS)
        nil
      SPANS
    }

    it {
      expect(
        inspector.inline(0..30, line_limit: line_limit)
      ).to match_row(<<~SPANS)
        0..30
      SPANS
    }

    it {
      expect(
        inspector.inline(
          'abcdefghabcdefghabcdefghabcdefghabcdefghabcdefghabcdefghabcdefghabcdefghabcdefgh',
          line_limit: line_limit
        )
      ).to match_row(<<~SPANS)
        "abcdefghabcdefghabcdefghabcdefghabcdefghabcdefghabcdefghabcdefghabcdefghabcde…"
      SPANS
    }

    it {
      expect(inspector.inline([1, 2, 3], line_limit: line_limit)).to match_row(<<~SPANS)
        [1, 2, 3]
      SPANS
    }

    it {
      expect(
        inspector.inline(
          [1, 'Tenet is awesome', 'Inception is better', { a: 1, b: 2 }],
          line_limit: line_limit
        )
      ).to match_row(<<~SPANS)
        [1, "Tenet is awesome", "Inception is better", {:a → 1, :b → 2}]
      SPANS
    }

    it {
      expect(
        inspector.inline(
          [1, 'Tenet is awesome', 'Inception is better', { a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7 }],
          line_limit: line_limit
        )
      ).to match_row(<<~SPANS)
        [1, "Tenet is awesome", "Inception is better", {:a → 1, :b → 2, :c → 3, …}]
      SPANS
    }

    it {
      expect(
        inspector.inline(
          [1, 'Tenet is awesome ' * 100, 'Inception is better ' * 100, { a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7 }],
          line_limit: line_limit
        )
      ).to match_row(<<~SPANS)
        [1, "Tenet is awesome Tenet is a…", "Inception is better Incepti…", …]
      SPANS
    }

    it {
      expect(
        inspector.inline(
          [1, { a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7 }, 'Inception is better ' * 100],
          line_limit: line_limit
        )
      ).to match_row(<<~SPANS)
        [1, {:a → 1, :b → 2, :c → 3, …}, "Inception is better Incepti…"]
      SPANS
    }

    it {
      expect(inspector.inline((1..21).to_a, line_limit: line_limit)).to match_row(<<~SPANS)
        [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21]
      SPANS
    }

    it {
      expect(inspector.inline((1..100).to_a, line_limit: 80)).to match_row(<<~SPANS)
        [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, …]
      SPANS
    }

    it {
      expect(
        inspector.inline(
          { movies: [{ name: 'Inception', director: 'Nolan' }, { name: 'Interstella', director: 'Nolan' }] },
          line_limit: line_limit
        )
      ).to match_row(<<~SPANS)
        {:movies → [{:name → "Inception", …}, {:name → "Interstella", …}]}
      SPANS
    }

    it {
      expect(
        inspector.inline(
          { var_a: 1, var_b: 2, var_c: 'longggggggggggggggggggggg', var_d: :this_is_a_really_long_symbol },
          line_limit: line_limit
        )
      ).to match_row(<<~SPANS)
        {:var_a → 1, :var_b → 2, :var_c → "longgggggggggggggggggg…", …}
      SPANS
    }

    it {
      hash = { other_1: 1, other_2: 2 }
      hash[:self] = hash
      expect(
        inspector.inline(hash, line_limit: line_limit)
      ).to match_row(<<~SPANS)
        {:other_1 → 1, :other_2 → 2, :self → {:other_1 → 1, …}}
      SPANS
    }

    it {
      expect(
        inspector.inline(
          { level_1: { level_2: { level_3: { level_4: { level_5: 'core' } } } } },
          line_limit: line_limit
        )
      ).to match_row(<<~SPANS)
        {:level_1 → {:level_2 → {:level_3 → {:level_4 → {…}}}}}
      SPANS
    }

    it {
      expect(
        inspector.inline(
          {
            level_1_a: { level_2_a: { level_3_a: 'a', level_3_b: 'b' } },
            level_1_b: { level_2_b: { level_3_c: 'c', level_3_d: 'd' } }
          },
          line_limit: line_limit
        )
      ).to match_row(<<~SPANS)
        {:level_1_a → {:level_2_a → {…}}, :level_1_b → {:level_2_b → {…}}}
      SPANS
    }

    it {
      expect(
        inspector.inline(
          [
            [{ level_1_a: { level_2_a: 'a', level_2_b: 'b' } }],
            [{ level_1_b: { level_2_c: 'c', level_2_d: 'd' } }]
          ],
          line_limit: line_limit
        )
      ).to match_row(<<~SPANS)
        [[{:level_1_a → {…}}], [{:level_1_b → {…}}]]
      SPANS
    }

    it {
      expect(
        inspector.inline(
          [
            [[1, 2], [3, 4]],
            [[5, 6], [7, 8]]
          ],
          line_limit: line_limit
        )
      ).to match_row(<<~SPANS)
        [[[1, 2], [3, 4]], [[5, 6], [7, 8]]]
      SPANS
    }

    it {
      expect(
        inspector.inline(
          Struct.new(:name, :director).new('Tenet', 'Christopher Nolan'),
          line_limit: line_limit
        )
      ).to match_row(<<~SPANS)
        #<struct name → "Tenet", director → "Christopher Nolan">
      SPANS
    }

    it {
      expect(
        inspector.inline(
          Struct.new(:name, :director, :plot).new(
            'Tenet', 'Christopher Nolan',
            'A secret agent embarks on a dangerous, time-bending mission to prevent the start of World War III.'
          ),
          line_limit: line_limit
        )
      ).to match_row(<<~SPANS)
        #<struct name → "Tenet", director → "Christopher Nolan", …>
      SPANS
    }

    it {
      stub_const('FilmStruct', Struct.new(:name, :director, :plot))
      expect(
        inspector.inline(
          FilmStruct.new(
            'Tenet', 'Christopher Nolan',
            'A secret agent embarks on a dangerous, time-bending mission to prevent the start of World War III.'
          ),
          line_limit: line_limit
        )
      ).to match_row(<<~SPANS)
        #<struct FilmStruct name → "Tenet", director → "Christopher Nolan", …>
      SPANS
    }

    it {
      expect(
        inspector.inline(
          OpenStruct.new(name: 'Tenet', director: 'Christopher Nolan'),
          line_limit: line_limit
        )
      ).to match_row(<<~SPANS)
        #<OpenStruct name="Tenet", director="Christopher Nolan">
      SPANS
    }

    it {
      expect(
        inspector.inline(
          OpenStruct.new(
            name: 'Tenet', director: 'Christopher Nolan',
            plot: 'A secret agent embarks on a dangerous, time-bending mission to prevent the start of World War III.'
          ),
          line_limit: line_limit
        )
      ).to match_row(<<~SPANS)
        #<OpenStruct name="Tenet", director="Christopher Nolan", plot="A secret agent …>
      SPANS
    }

    it {
      a = Object.new
      3.times { |index| a.instance_variable_set("@var_#{index}".to_sym, index) }
      expect(
        inspector.inline(a, line_limit: line_limit)
      ).to match_row(<<~SPANS)
        #<Object:?????????????????? @var_0 → 0, @var_1 → 1, @var_2 → 2>
      SPANS
    }

    it {
      a = Object.new
      10.times { |index| a.instance_variable_set("@var_#{index}".to_sym, index) }
      expect(
        inspector.inline(a, line_limit: line_limit)
      ).to match_row(<<~SPANS)
        #<Object:?????????????????? @var_0 → 0, @var_1 → 1, @var_2 → 2, @var_3 → 3, …>
      SPANS
    }

    it {
      a = Object.new
      3.times { |index| a.instance_variable_set("@var_#{index}".to_sym, index.to_s * 30) }
      expect(
        inspector.inline(a, line_limit: line_limit)
      ).to match_row(<<~SPANS)
        #<Object:?????????????????? @var_0 → "0000000000000000000000…", …>
      SPANS
    }

    it {
      stub_const('ThisIsATestClass', Class.new)
      a = ThisIsATestClass.new
      3.times { |index| a.instance_variable_set("@var_#{index}".to_sym, index.to_s * 30) }
      expect(
        inspector.inline(a, line_limit: line_limit)
      ).to match_row(<<~SPANS)
        #<ThisIsATestClass:?????????????????? @var_0 → "0000000000000000000000…", …>
      SPANS
    }

    it {
      expect(
        inspector.inline(BasicObject.new, line_limit: line_limit)
      ).to match_row(<<~SPANS)
        #<BasicObject:??????????????????>
      SPANS
    }

    it {
      stub_const('ThisIsATestClass', Class.new(BasicObject))
      a = ThisIsATestClass.new
      3.times { |index| RubyJard::Reflection.instance.call_instance_variable_set(a, "@var_#{index}".to_sym, index) }
      expect(
        inspector.inline(a, line_limit: line_limit)
      ).to match_row(<<~SPANS)
        #<ThisIsATestClass:?????????????????? @var_0 → 0, @var_1 → 1, @var_2 → 2>
      SPANS
    }

    it {
      stub_const(
        'ThisIsATestClass',
        Class.new(BasicObject) do
          def inspect
            ::Kernel.raise 'Please do not step on the Minefield'
          end

          def to_s
            ::Kernel.raise 'Please do not step on the Minefield'
          end
        end
      )
      a = ThisIsATestClass.new
      3.times { |index| RubyJard::Reflection.instance.call_instance_variable_set(a, "@var_#{index}".to_sym, index) }
      expect(
        inspector.inline(a, line_limit: line_limit)
      ).to match_row(<<~SPANS)
        #<ThisIsATestClass:??????????????????>
      SPANS
    }

    it {
      a = Object.new
      b = Object.new
      c = Object.new
      a.instance_variable_set(:@var_b, b)
      b.instance_variable_set(:@var_c, c)
      expect(
        inspector.inline(a, line_limit: line_limit)
      ).to match_row(<<~SPANS)
        #<Object:?????????????????? @var_b → #<Object:?????????????????? …>>
      SPANS
    }

    it {
      a = Object.new
      b = Object.new
      c = Object.new
      a.instance_variable_set(:@var_b, b)
      a.instance_variable_set(:@var_c, c)
      expect(
        inspector.inline(a, line_limit: line_limit)
      ).to match_row(<<~SPANS)
        #<Object:?????????????????? @var_b → #<Object:??????????????????>, …>
      SPANS
    }

    it {
      a = Object.new
      b = Object.new
      c = 'ccc'
      a.instance_variable_set(:@var_b, b)
      a.instance_variable_set(:@int_1, 1000)
      b.instance_variable_set(:@var_c, c)
      b.instance_variable_set(:@int_2, 2000)
      expect(
        inspector.inline(a, line_limit: 100)
      ).to match_row(<<~SPANS)
        #<Object:?????????????????? @var_b → #<Object:?????????????????? …>, @int_1 → 1000>
      SPANS
    }

    it {
      a = Object.new
      b = Object.new
      a.instance_variable_set(:@var_1, 1)
      b.instance_variable_set(:@var_2, 2)
      expect(
        inspector.inline([a, b], line_limit: 100)
      ).to match_row(<<~SPANS)
        [#<Object:?????????????????? @var_1 → 1>, #<Object:?????????????????? @var_2 → 2>]
      SPANS
    }

    it {
      a = Object.new
      b = Object.new
      c = Object.new
      a.instance_variable_set(:@var_1, 1)
      b.instance_variable_set(:@var_2, 2)
      c.instance_variable_set(:@var_3, 3)
      expect(
        inspector.inline([a, b, c], line_limit: 100)
      ).to match_row(<<~SPANS)
        [#<Object:?????????????????? …>, #<Object:?????????????????? …>, #<Object:?????????????????? …>]
      SPANS
    }

    it {
      a = [1, 2, 3]
      a << a
      expect(
        inspector.inline(a, line_limit: line_limit)
      ).to match_row(<<~SPANS)
        [1, 2, 3, [1, 2, 3, [1, 2, 3, […]]]]
      SPANS
    }

    it {
      stub_const('J1X', Class.new)
      a = J1X.new
      b = J1X.new
      c = J1X.new
      a.instance_variable_set(:@var_b, b)
      b.instance_variable_set(:@var_c, c)
      c.instance_variable_set(:@var_a, a)
      expect(
        inspector.inline(a, line_limit: 100)
      ).to match_row(<<~SPANS)
        #<J1X:?????????????????? @var_b → #<J1X:?????????????????? @var_c → #<J1X:?????????????????? …>>>
      SPANS
    }

    it {
      stub_const('MyError', Class.new(StandardError))
      expect(
        inspector.inline(MyError.new('This is my fault'), line_limit: line_limit)
      ).to match_row(<<~SPANS)
        #<MyError: This is my fault>
      SPANS
    }
  end

  context 'with #multiline' do
    let(:line_limit) { 60 }

    it {
      expect(
        inspector.multiline(true, line_limit: line_limit, lines: 7)
      ).to match_rows(<<~SPANS)
        true
      SPANS
    }

    it {
      expect(
        inspector.multiline(false, line_limit: line_limit, lines: 7)
      ).to match_rows(<<~SPANS)
        false
      SPANS
    }

    it {
      expect(
        inspector.multiline(12_345, line_limit: line_limit, lines: 7)
      ).to match_rows(<<~SPANS)
        12345
      SPANS
    }

    it {
      expect(
        inspector.multiline(123.456, line_limit: line_limit, lines: 7)
      ).to match_rows(<<~SPANS)
        123.456
      SPANS
    }

    it {
      expect(
        inspector.multiline((123 + 0i), line_limit: line_limit, lines: 7)
      ).to match_rows(<<~SPANS)
        (123+0i)
      SPANS
    }

    it {
      expect(
        inspector.multiline(
          /abcdef.*[a-z0-9]+/i,
          line_limit: line_limit, lines: 7
        )
      ).to match_rows(<<~SPANS)
        /abcdef.*[a-z0-9]+/i
      SPANS
    }

    it {
      expect(
        inspector.multiline(
          method(:inspector).to_proc,
          line_limit: line_limit, lines: 7
        )
      ).to match_rows(<<~SPANS)
        #<Proc:?????????????????? (lambda)>
      SPANS
    }

    it {
      expect(
        inspector.multiline(
          123_345_789_123_345_789_123_345_789_123_345_789_123_345_789_123_345_789_123_345_789_123_345_789_123_345_789,
          line_limit: line_limit, lines: 7
        )
      ).to match_rows(<<~SPANS)
        123345789123345789123345789123345789123345789123345789123345789123345789123345789
      SPANS
    }

    it {
      expect(
        inspector.multiline(
          Object,
          line_limit: line_limit, lines: 7
        )
      ).to match_rows(<<~SPANS)
        Object
      SPANS
    }

    it {
      stub_const('MyObject', Class.new)
      MyObject.instance_variable_set(:@var_a, 1)
      MyObject.instance_variable_set(:@var_b, '222')
      expect(
        inspector.multiline(
          MyObject,
          line_limit: line_limit, lines: 7
        )
      ).to match_rows(<<~SPANS)
        MyObject
      SPANS
    }

    it {
      expect(
        inspector.multiline(
          :some_thing,
          line_limit: line_limit, lines: 7
        )
      ).to match_rows(<<~SPANS)
        :some_thing
      SPANS
    }

    it {
      expect(
        inspector.multiline(
          nil,
          line_limit: line_limit, lines: 7
        )
      ).to match_rows(<<~SPANS)
        nil
      SPANS
    }

    it {
      expect(
        inspector.multiline(
          0..30,
          line_limit: line_limit, lines: 7
        )
      ).to match_rows(<<~SPANS)
        0..30
      SPANS
    }

    it {
      expect(
        inspector.multiline(
          'abcdefghabcdefghabcdefghabcdefghabcdefghabcdefghabcdefghabcdefghabcdefghabcdefgh',
          line_limit: line_limit, lines: 7
        )
      ).to match_rows(<<~SPANS)
        "abcdefghabcdefghabcdefghabcdefghabcdefghabcdefghabcdefghabcdefghabcdefghabcdefgh"
      SPANS
    }

    it {
      expect(
        inspector.multiline(
          [1, 2, 3],
          line_limit: line_limit, lines: 7
        )
      ).to match_rows(<<~SPANS)
        [1, 2, 3]
      SPANS
    }

    it {
      expect(
        inspector.multiline(
          (1..100).to_a,
          line_limit: line_limit, lines: 7
        )
      ).to match_rows(<<~SPANS)
        [
          ▸ 1
          ▸ 2
          ▸ 3
          ▸ 4
          ▸ 5
          ▸ 6
          ▸ 94 more...]
      SPANS
    }

    it {
      expect(
        inspector.multiline(
          [1, 'Tenet is awesome', 'Inception is better', { a: 1, b: 2 }],
          line_limit: line_limit, lines: 7
        )
      ).to match_rows(<<~SPANS)
        [
          ▸ 1
          ▸ "Tenet is awesome"
          ▸ "Inception is better"
          ▸ {:a → 1, :b → 2}
        ]
      SPANS
    }

    it {
      expect(
        inspector.multiline(
          [
            1,
            'Tenet is awesome',
            'Inception is better',
            'Wait, what are you doing here?',
            { a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7 }
          ],
          line_limit: line_limit, lines: 7
        )
      ).to match_rows(<<~SPANS)
        [
          ▸ 1
          ▸ "Tenet is awesome"
          ▸ "Inception is better"
          ▸ "Wait, what are you doing here?"
          ▸ {:a → 1, :b → 2, :c → 3, :d → 4, :e → 5, :f → 6, …}
        ]
      SPANS
    }

    it {
      expect(
        inspector.multiline(
          [1, 'Tenet is awesome ' * 100, 'Inception is better ' * 100, { a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7 }],
          line_limit: line_limit, lines: 7
        )
      ).to match_rows(<<~SPANS)
        [
          ▸ 1
          ▸ "Tenet is awesome Tenet is awesome Tenet is awesome Te…"
          ▸ "Inception is better Inception is better Inception is …"
          ▸ {:a → 1, :b → 2, :c → 3, :d → 4, :e → 5, :f → 6, …}
        ]
      SPANS
    }

    it {
      expect(
        inspector.multiline(
          { movies: [{ name: 'Inception', director: 'Nolan' }, { name: 'Interstella', director: 'Nolan' }] },
          line_limit: 40, lines: 7
        )
      ).to match_rows(<<~SPANS)
        {:movies → [{:name → "Inception", …}, {:name → "Interstella", …}]}
      SPANS
    }

    it {
      expect(
        inspector.multiline(
          { a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7, h: 8, i: 9, j: 10 },
          line_limit: line_limit, lines: 7
        )
      ).to match_rows(<<~SPANS)
        {
          ▸ :a → 1
          ▸ :b → 2
          ▸ :c → 3
          ▸ :d → 4
          ▸ :e → 5
          ▸ :f → 6
          ▸ 4 more...}
      SPANS
    }

    it {
      expect(
        inspector.multiline(
          { var_a: 1, var_b: 2, var_c: 'longggggggggggggggggggggg', var_d: :this_is_a_really_long_symbol },
          line_limit: line_limit, lines: 7
        )
      ).to match_rows(<<~SPANS)
        {
          ▸ :var_a → 1
          ▸ :var_b → 2
          ▸ :var_c → "longggggggggggggggggggggg"
          ▸ :var_d → :this_is_a_really_long_symbol
        }
      SPANS
    }

    it {
      hash = { other_1: 1, other_2: 2, other_3: 3, other_4: 4, other_5: 5 }
      hash[:self] = hash
      expect(
        inspector.multiline(
          hash,
          line_limit: line_limit, lines: 7
        )
      ).to match_rows(<<~SPANS)
        {
          ▸ :other_1 → 1
          ▸ :other_2 → 2
          ▸ :other_3 → 3
          ▸ :other_4 → 4
          ▸ :other_5 → 5
          ▸ :self → {:other_1 → 1, :other_2 → 2, :other_3 → 3, …}
        }
      SPANS
    }

    it {
      expect(
        inspector.multiline(
          { level_1: { level_2: { level_3: { level_4: { level_5: 'core' } } } } },
          line_limit: 40, lines: 7
        )
      ).to match_rows(<<~SPANS)
        {:level_1 → {:level_2 → {:level_3 → {:level_4 → {…}}}}}
      SPANS
    }

    it {
      expect(
        inspector.multiline(
          {
            level_1_a: { level_2_a: { level_3_a: 'a', level_3_b: 'b' } },
            level_1_b: { level_2_b: { level_3_c: 'c', level_3_d: 'd' } }
          },
          line_limit: line_limit, lines: 7
        )
      ).to match_rows(<<~SPANS)
        {
          ▸ :level_1_a → {:level_2_a → {:level_3_a → "a", …}}
          ▸ :level_1_b → {:level_2_b → {:level_3_c → "c", …}}
        }
      SPANS
    }

    it {
      expect(
        inspector.multiline(
          [
            [{ level_1_a: { level_2_a: 'a', level_2_b: 'b' } }],
            [{ level_1_b: { level_2_c: 'c', level_2_d: 'd' } }],
            [{ level_1_c: { level_2_e: 'e', level_2_f: 'f' } }]
          ],
          line_limit: line_limit, lines: 7
        )
      ).to match_rows(<<~SPANS)
        [
          ▸ [{:level_1_a → {…}}]
          ▸ [{:level_1_b → {…}}]
          ▸ [{:level_1_c → {…}}]
        ]
      SPANS
    }

    it {
      expect(
        inspector.multiline(
          [
            [[1, 2], [3, 4], [5, 6], [7, 8], [9, 10]],
            [[1, 2], [3, 4], [5, 6], [7, 8], [9, 10]]
          ],
          line_limit: line_limit, lines: 7
        )
      ).to match_rows(<<~SPANS)
        [
          ▸ [[1, 2], [3, 4], [5, 6], [7, 8], [9, 10]]
          ▸ [[1, 2], [3, 4], [5, 6], [7, 8], [9, 10]]
        ]
      SPANS
    }

    it {
      expect(
        inspector.multiline(
          Struct.new(:name, :director).new('Tenet', 'Christopher Nolan'),
          line_limit: line_limit, lines: 7
        )
      ).to match_rows(<<~SPANS)
        #<struct name → "Tenet", director → "Christopher Nolan">
      SPANS
    }

    it {
      expect(
        inspector.multiline(
          Struct.new(:timeline, :name, :director, :plot).new(
            [1, 2, 3, 4, 5, 7, 8, 9],
            'Tenet', 'Christopher Nolan',
            'A secret agent embarks on a dangerous, time-bending mission to prevent the start of World War III.'
          ),
          line_limit: line_limit, lines: 7
        )
      ).to match_rows(<<~SPANS)
        #<struct>
          ▸ timeline → [1, 2, 3, 4, 5, 7, 8, 9]
          ▸ name → "Tenet"
          ▸ director → "Christopher Nolan"
          ▸ plot → "A secret agent embarks on a dangerous, time-be…"
      SPANS
    }

    it {
      stub_const('FilmStruct', Struct.new(:timeline, :name, :director, :plot))
      expect(
        inspector.multiline(
          FilmStruct.new(
            [1, 2, 3, 4, 5, 7, 8, 9],
            'Tenet', 'Christopher Nolan',
            'A secret agent embarks on a dangerous, time-bending mission to prevent the start of World War III.'
          ),
          line_limit: line_limit, lines: 7
        )
      ).to match_rows(<<~SPANS)
        #<struct FilmStruct>
          ▸ timeline → [1, 2, 3, 4, 5, 7, 8, 9]
          ▸ name → "Tenet"
          ▸ director → "Christopher Nolan"
          ▸ plot → "A secret agent embarks on a dangerous, time-be…"
      SPANS
    }

    it {
      a = Object.new
      3.times { |index| a.instance_variable_set("@var_#{index}".to_sym, index) }
      expect(
        inspector.multiline(a, line_limit: line_limit, lines: 7)
      ).to match_rows(<<~SPANS)
        #<Object:??????????????????>
          ▸ @var_0 → 0
          ▸ @var_1 → 1
          ▸ @var_2 → 2
      SPANS
    }

    it {
      a = Object.new
      10.times { |index| a.instance_variable_set("@var_#{index}".to_sym, index) }
      expect(
        inspector.multiline(a, line_limit: line_limit, lines: 7)
      ).to match_rows(<<~SPANS)
        #<Object:??????????????????>
          ▸ @var_0 → 0
          ▸ @var_1 → 1
          ▸ @var_2 → 2
          ▸ @var_3 → 3
          ▸ @var_4 → 4
          ▸ 5 more...
      SPANS
    }

    it {
      a = Object.new
      3.times { |index| a.instance_variable_set("@var_#{index}".to_sym, index.to_s * 30) }
      expect(
        inspector.multiline(a, line_limit: line_limit, lines: 7)
      ).to match_rows(<<~SPANS)
        #<Object:??????????????????>
          ▸ @var_0 → "000000000000000000000000000000"
          ▸ @var_1 → "111111111111111111111111111111"
          ▸ @var_2 → "222222222222222222222222222222"
      SPANS
    }

    it {
      stub_const('ThisIsATestClass', Class.new)
      a = ThisIsATestClass.new
      10.times { |index| a.instance_variable_set("@var_#{index}".to_sym, index.to_s * 30) }
      expect(
        inspector.multiline(
          a,
          line_limit: line_limit, lines: 7
        )
      ).to match_rows(<<~SPANS)
        #<ThisIsATestClass:??????????????????>
          ▸ @var_0 → "000000000000000000000000000000"
          ▸ @var_1 → "111111111111111111111111111111"
          ▸ @var_2 → "222222222222222222222222222222"
          ▸ @var_3 → "333333333333333333333333333333"
          ▸ @var_4 → "444444444444444444444444444444"
          ▸ 5 more...
      SPANS
    }

    it {
      expect(
        inspector.multiline(
          BasicObject.new,
          line_limit: line_limit, lines: 7
        )
      ).to match_rows(<<~SPANS)
        #<BasicObject:??????????????????>
      SPANS
    }

    it {
      stub_const('ThisIsATestClass', Class.new(BasicObject))
      a = ThisIsATestClass.new
      3.times { |index| RubyJard::Reflection.instance.call_instance_variable_set(a, "@var_#{index}".to_sym, index) }
      expect(
        inspector.multiline(a, line_limit: line_limit, lines: 7)
      ).to match_rows(<<~SPANS)
        #<ThisIsATestClass:??????????????????>
          ▸ @var_0 → 0
          ▸ @var_1 → 1
          ▸ @var_2 → 2
      SPANS
    }

    it {
      stub_const(
        'ThisIsATestClass',
        Class.new(BasicObject) do
          def inspect
            ::Kernel.raise 'Please do not step on the Minefield'
          end

          def to_s
            ::Kernel.raise 'Please do not step on the Minefield'
          end
        end
      )
      a = ThisIsATestClass.new
      3.times { |index| RubyJard::Reflection.instance.call_instance_variable_set(a, "@var_#{index}".to_sym, index) }
      expect(
        inspector.multiline(a, line_limit: line_limit, lines: 7)
      ).to match_rows(<<~SPANS)
        #<ThisIsATestClass:??????????????????>
      SPANS
    }

    it {
      a = Object.new
      b = Object.new
      c = Object.new
      a.instance_variable_set(:@var_b, b)
      b.instance_variable_set(:@var_c, c)
      expect(
        inspector.multiline(a, line_limit: 100, lines: 7)
      ).to match_rows(<<~SPANS)
        #<Object:??????????????????>
          ▸ @var_b → #<Object:?????????????????? @var_c → #<Object:??????????????????>>
      SPANS
    }

    it {
      a = Object.new
      b = Object.new
      c = Object.new
      a.instance_variable_set(:@var_b, b)
      a.instance_variable_set(:@var_c, c)
      expect(
        inspector.multiline(a, line_limit: 100, lines: 7)
      ).to match_rows(<<~SPANS)
        #<Object:??????????????????>
          ▸ @var_b → #<Object:??????????????????>
          ▸ @var_c → #<Object:??????????????????>
      SPANS
    }

    it {
      a = Object.new
      b = Object.new
      c = 'ccc'
      a.instance_variable_set(:@var_b, b)
      a.instance_variable_set(:@int_1, 1000)
      a.instance_variable_set(:@int_2, 2000)
      b.instance_variable_set(:@var_c, c)
      b.instance_variable_set(:@int_3, 3000)
      expect(
        inspector.multiline(a, line_limit: 80, lines: 7)
      ).to match_rows(<<~SPANS)
        #<Object:??????????????????>
          ▸ @var_b → #<Object:?????????????????? @var_c → "ccc", @int_3 → 3000>
          ▸ @int_1 → 1000
          ▸ @int_2 → 2000
      SPANS
    }

    it {
      a = Object.new
      b = Object.new
      a.instance_variable_set(:@var_1, 1)
      b.instance_variable_set(:@var_2, 2)
      expect(
        inspector.multiline([a, b], line_limit: line_limit, lines: 7)
      ).to match_rows(<<~SPANS)
        [
          ▸ #<Object:?????????????????? @var_1 → 1>
          ▸ #<Object:?????????????????? @var_2 → 2>
        ]
      SPANS
    }

    it {
      a = [1, 2, 3]
      a << a
      expect(
        inspector.multiline(a, line_limit: line_limit, lines: 7)
      ).to match_rows(<<~SPANS)
        [
          ▸ 1
          ▸ 2
          ▸ 3
          ▸ [1, 2, 3, [1, 2, 3, […]]]
        ]
      SPANS
    }

    it {
      stub_const('J1X', Class.new)
      a = J1X.new
      b = J1X.new
      c = J1X.new
      a.instance_variable_set(:@var_b, b)
      b.instance_variable_set(:@var_c, c)
      c.instance_variable_set(:@var_a, a)
      expect(
        inspector.multiline(a, line_limit: 80, lines: 7)
      ).to match_rows(<<~SPANS)
        #<J1X:??????????????????>
          ▸ @var_b → #<J1X:?????????????????? @var_c → #<J1X:?????????????????? …>>
      SPANS
    }

    it {
      stub_const('MyError', Class.new(StandardError))
      error = MyError.new('This is my fault')
      error.instance_variable_set(:@detail, 'I forgot to clean up tests')
      expect(
        inspector.multiline(
          error,
          line_limit: line_limit, lines: 7
        )
      ).to match_rows(<<~SPANS)
        #<MyError: This is my fault>
      SPANS
    }
  end
end
