task :boot do
  load(File.join(File.dirname(__FILE__), 'console_init.rb'))
end

desc "Run all tests."
task :test => ["test:units", "test:examples"]

namespace :test do
  task :prepare => :boot do
    $:.unshift("#{File.dirname(__FILE__)}/test")
  end

  desc "Run all example tests."
  task :examples => ["test:prepare"] do
    test_files = Dir["#{File.dirname(__FILE__)}/test/examples/*_test.rb"]
    puts "[test:examples] Running: #{test_files.empty? ? 'none' : test_files.map{|fn| File.basename(fn)}.join(', ')}"
    test_files.each do |test_case|      
      require test_case
    end
  end

  desc "Run all unit tests."
  task :units => ["test:prepare"] do
    test_files = Dir["#{File.dirname(__FILE__)}/test/unit/*_test.rb"]
    puts "[test:units] Running: #{test_files.empty? ? 'none' : test_files.map{|fn| File.basename(fn)}.join(', ')}"
    test_files.each do |test_case|      
      require test_case
    end
  end
end
