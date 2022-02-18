#!/usr/bin/env ruby

require 'slather'

minimum_coverage = 90

def total_coverage (project)
	total_coverage = 0.0
	unless project.nil?
    	total_project_lines = 0
    	total_project_lines_tested = 0
    	project.coverage_files.each do |coverage_file|
    		total_project_lines_tested += coverage_file.num_lines_tested
    		total_project_lines += coverage_file.num_lines_testable
    		total_coverage = (total_project_lines_tested / total_project_lines.to_f) * 100.0
   		end
   	end
   	total_coverage
end
scheme = ARGV[1]
project = Slather::Project.open('./' + scheme + '.xcodeproj')
project.source_directory = './output'
project.output_directory = './output'
project.scheme = scheme
project.coverage_service = :terminal  
project.configure
coverage = total_coverage(project)
puts('Total Coverage: ' + coverage.to_s + '%')

if coverage < minimum_coverage 
	puts('Error: Low Coverage. Must be >= ' + minimum_coverage.to_s  + '%')
	exit -1
end