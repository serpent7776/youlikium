Gem::Specification.new do |s|
	s.name        = 'youlikium'
	s.version     = '0.1.0'
	s.date        = '2017-07-23'
	s.summary     = 'automates liking youtube videos using selenium'
	s.description = s.summary
	s.authors     = ["Serpent7776"]
	s.email       = 'serpent7776@gmail.com'
	s.files       = `git ls-files lib/`.split "\n"
	s.executables = `git ls-files bin/`.split("\n").map{|file| file.gsub('bin/', '')}
	s.homepage    = 'https://github.com/serpent7776/youlikium'
	s.license     = 'BSD-2-Clause'
	s.add_runtime_dependency 'selenium-webdriver', ['~> 3.4']
end
