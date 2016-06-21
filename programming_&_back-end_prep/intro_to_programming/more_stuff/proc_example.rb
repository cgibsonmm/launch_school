# proc_example.rb

talk = proc.new do
  puts "i am talking"
end

talk.call

# proc_example2.rb

talk = Proc.new do |name|
  puts "I am talking to #{name}"
end

take.call "Bob"
