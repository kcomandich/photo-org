#!/usr/bin/env ruby

require 'pry-byebug'

class PhotoOrg
  def initialize
    @photos = []
    @cities = {}
    @newfilenames = []
  end

  def solution(s)
    s.lines.each do |photo|
      filename, city, date = photo.split(", ")
      @cities[city] ||= []
      @cities[city].push(date)
      @photos.push(city: city, date: date, ext: extension(filename))
    end

    @cities.values.map(&:sort!)

    @photos.each do |photo|
      @newfilenames.push("#{numbered_city(photo[:city], photo[:date])}.#{photo[:ext]}")
    end

    @newfilenames
  end

  private

  def numbered_city(city, date)
    num = @cities[city].index(date) + 1
    num_dates = @cities[city].count
    city + num.to_s.rjust(num_dates.digits.count, "0")
  end

  def extension(filename)
    filename.match(/jpg|png|jpeg/)
  end
end

if $PROGRAM_NAME == __FILE__
  p = PhotoOrg.new

  puts p.solution(IO.read("input.txt"))
end
