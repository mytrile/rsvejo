$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'

require 'test/unit'
require 'rsvejo'

class TestRSvejo < Test::Unit::TestCase


  def test_stories
    fresh_stories = RSvejo.fresh_stories
    green_stories = RSvejo.green_stories
    assert_not_nil fresh_stories
    assert_not_nil green_stories
  end

  def test_user_calls
    name = 'stanislav'
    voted = RSvejo.voted_by name
    published = RSvejo.published_by name
    commented = RSvejo.commented_by name

    assert_not_nil voted
    assert_not_nil published
    assert_not_nil commented
  end

  def test_tag_method
    tag  = RSvejo.get_by_tag("София")
    assert !tag.include?('nil_classes')
  end

  def test_site_method
    site = RSvejo.get_by_site('blog.svejo.net')
    assert_nil site["hash"]
  end

  def test_comments_for_method
    comments = RSvejo.comments_for('http://advance.bg/?pn=pamporovo')
    assert_not_nil comments
  end

end
