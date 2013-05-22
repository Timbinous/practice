class WordAnalyzer
  @queue = 'some_queue_name'

  def self.perform(from_queue)
    puts "About to do some heavy duty analysis on #{from_queue}"
    sleep 3
    puts "Finished with analysis on #{from_queue}"
  end
end
