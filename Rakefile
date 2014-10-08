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

desc "Build list of shit"
task "build_list" do
  File.open("./public/all.html","w") do |f|
    f.puts "<html><head><meta charset=\"UTF-8\" /></head><body>"

    (0..9).each do |a|
      (0..9).each do |b|
        (0..9).each do |c|
          (0..9).each do |d|
            seed = [a,b,c,d].join("-")
            shit = Bullshit.new(seed)
            f.puts '<li><a href="/%s">%s</a></li>' % [shit.seed, shit.to_s]
          end
        end
      end
    end

    f.puts "</body></html>"
  end


end
