require 'bundler'
Bundler.require

class Gossip

  attr_accessor :author, :content, :id

  def initialize(id, content, author)
    @content = content
    @author = author
    @id = id
  end

  def save
    csv_string = "#{@id},#{@author},#{@content}"
    csv_file = File.open("db/gossip.csv", "ab")
    csv_file.puts(csv_string)
    csv_file.close
  end

  def self.all
  	all_gossips = []
  	CSV.read("./db/gossip.csv").each do |csv_line|
    	all_gossips << Gossip.new(csv_line[0], csv_line[1], csv_line[2])
  	end
  	return all_gossips
	end

  def self.find2(index)
  	find = []
    content = CSV.read("./db/gossip.csv")
    find = content[index-1]
    return find
  end
  
end
