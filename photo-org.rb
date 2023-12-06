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
      @cities[city] = [] unless @cities[city]
      @cities[city].push(date)
      @photos.push(city: city, date: date, extension: filename.match(/jpg|png|jpeg/))
    end

    @cities.values.map(&:sort!)

    @photos.each do |photo|
      @newfilenames.push("#{numbered_city(photo[:city], photo[:date])}.#{photo[:extension]}")
    end

    @newfilenames
  end

  private

  def numbered_city(city, date)
    num = @cities[city].index(date) + 1
    num_dates = @cities[city].count
    city + num.to_s.rjust(num_dates.digits.count, "0")
  end
end

if $PROGRAM_NAME == __FILE__
  p = PhotoOrg.new

  puts p.solution(IO.read("input.txt"))
end
