# encoding: utf-8

# Library       : RSvejo (Svejo.net API in Ruby)
# Author        : Mitko Kostov
# Site          : http://mitkokostov.info
# Mail          : mitko.kostov@gmail.com
# LICENCE       : MIT
# svejo.net API : http://groups.google.com/group/svejo/web/api 

begin
  require 'httparty'
rescue LoadError
  require 'rubygems'
  require 'httparty'
end

$KCODE ='u' if RUBY_VERSION < '1.9'

# The main RSvejo module
# Usage: See the README.md
module RSvejo

  extend self

  API_URL = 'http://svejo.net/public_api/'
  FORMAT  = 'xml'

  # Returns 15 of the latest 'fresh' stories
  def fresh_stories
    get_data("stories/fresh")
  end

  # Returns 15 of the latest 'green' stories'
  def green_stories
    get_data("stories/green")
  end

  # Returns 15 of the latest stories of the specified user
  def voted_by(name)
    get_data("user/#{name}/voted")
  end

  # Returns 15 of the latest stories published by the specified user
  # @param [String] -  name of the user
  def published_by(name)
    get_data("user/#{name}/published")
  end

  # Returns 15 of the latest commented stories by the specified user
  def commented_by(name)
    get_data("user/#{name}/commented")
  end

  # Returns 15 of the latest stories specified by the given tag
  def get_by_tag(tag)
    get_data("tag/#{tag}/new")
  end

  # Returns 15 of the latest stories about the specified site
  def get_by_site(site)
    get_data("site/#{site}/new")
  end

  # Returns 15 of the latest comments about the specified site
  def comments_for(url)
    get_data("comments/show/#{FORMAT}?url=#{url}")
  end

  private

  def get_data(arg)
    HTTParty.get URI.escape("#{API_URL}#{arg}.#{FORMAT}")
  end

end
