require 'launchy'
require_relative 'short_url'
require_relative 'long_url'
require_relative 'user'
require_relative 'visit'

class Application
  attr_accessor :name, :email, :user, :urls

  def create_user
    @user = User.new(:name => name, :email => email)
    @user.save! if @user.new_record?
  end

  def initialize
    #urls = {:short => '', :long => ''}
  end

  def ask_user_for_name
    puts "What is your name?"
    @name = gets.chomp
    puts "What is your email?"
    @email = gets.chomp
  end

  def ask_user_for_option
    puts "What would you like to do:"
    puts "To shorten url press 1"
    puts "To open short url press 2"
    input = gets.chomp.to_i
  end

  def get_url
    puts "Enter url..."
    gets.chomp
  end

  def shorten_url(long_url_str)
    string= "#{long_url[0]} + #{rand(100)}"
    long_url = LongUrl.new(:long_url => long_url_str)
    long_url.save! if long_url.new_record?
    
    short_url = ShortUrl.new(:short_url => string, :long_url_id => long_url.id)
    short_url.save! if short_url.new_record?

  end

  def visit_page(short_url_str)
    Launchy(short_url)
    short_id = ShortUrl.find_by_short_url(short_url_str).id

   # Visit.new(:short_url_id => short_id, :user_id, :comment => '')
  end


end


if __FILE__ == $PROGRAM_NAME

  app = Application.new
  app.ask_user_for_name
  app.create_user

    choice = ask_user_for_option

    case choice
    when 1
      shorten_url(get_url)
    when 2
      visit_page(get_url)
    else
      raise 'Incorrect input ....'
    end
end