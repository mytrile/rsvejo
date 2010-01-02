# encoding: utf-8

# Library       : RSvejo (Svejo.net API in Ruby)
# Author        : Mitko Kostov
# Site          : http://mitkokostov.info
# Mail          : mitko.kostov@gmail.com
# LICENCE       : MIT
# svejo.net API : http://groups.google.com/group/svejo/web/api 

require 'rubygems'
require 'httparty'

$KCODE ='u'

module RSvejo

  extend self

  API_URL = 'http://svejo.net/public_api/'
  FORMAT  = 'xml'

  def fresh_stories
    get_data("stories/fresh")
  end

  def green_stories
    get_data("stories/green")
  end

  def voted_by(name)
    get_data("user/#{name}/voted")
  end

  def published_by(name)
    get_data("user/#{name}/published")
  end

  def commented_by(name)
    get_data("user/#{name}/commented")
  end

  def get_by_tag(tag)
    get_data("tag/#{tag}/new")
  end

  def get_by_site(site)
    get_data("site/#{site}/new")
  end

  def comments_for(url)
    get_data("comments/show/#{FORMAT}?url=#{url}")
  end

  private

  def get_data(arg)
    HTTParty.get URI.escape("#{API_URL}#{arg}.#{FORMAT}")
  end

end
