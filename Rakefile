require_relative './boot'

desc "Generate bullshit"
task :bulshit do
  puts Bullshit.new
end

desc "Load shit"
task :load_shit, :seed do |t, args|
  seed = args.seed
  puts Bullshit.new(seed)
end
