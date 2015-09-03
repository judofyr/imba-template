require 'bundler/setup'
require 'minitest/autorun'

require 'imba/template'

class TestImbaTemplate < Minitest::Test
  def test_registers_in_tilt
    assert_equal Imba::Template, Tilt["imba"]
    assert_equal Imba::Template, Tilt["hello.imba"]
  end

  def test_basic
    js = Imba::Template.new { "a:b" }.render
    assert_match "this.a().b", js
  end

  def test_bare
    js = Imba::Template.new(bare: true) { "a:b" }.render
    refute_match "function", js
  end

  def test_sourcemaps
    js = Imba::Template.new(sourceMapInline: true) { "a:b" }.render
    assert_match "//# sourceMappingURL", js
  end
end

