#!/usr/bin/env ruby

require 'pry-byebug'

class PhotoOrg
  def initialize
    @input = IO.read("input.txt")
    @photos = []
    @cities = {}
    @newfilenames = []
  end

  def run
    solution(@input)
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

  def numbered_city(city, date)
    count = @cities[city].index(date) + 1
    largest = @cities[city].count
    city + count.to_s.rjust(largest.digits.count, "0")
  end
end

if $PROGRAM_NAME == __FILE__
  p = PhotoOrg.new

  puts p.run
end
