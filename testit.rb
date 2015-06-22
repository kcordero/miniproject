require 'csv'

expected = CSV.read("expected.csv")
comparelist = CSV.read("actual.csv")

completelist=[]
differentlist=[]
missinglist=[]

expected.each do |pkg|
  foundflag = 0
  comparelist.each do |comppkg|
    if pkg[0] == comppkg[0]
       if pkg[1] == comppkg[1]
       	 completelist.push(comppkg)
       else
         differentlist.push(pkg)
       end
       foundflag = 1
       comparelist.delete(comppkg)
    end
  end	
  if foundflag == 0
    missinglist.push(pkg)
  end
end


puts "CORRECT PACKAGES ON ACTUAL"
completelist.each do |pkg|
 puts "#{pkg[0]}, #{pkg[1]} "
end

puts "\nPACKAGES WITH INCORRECT VERSIONS ON ACTUAL"
differentlist.each do |pkg|
 puts "#{pkg[0]}, #{pkg[1]} "
end

puts "\nPACKAGES THAT ARE NOT ON ACTUAL"
missinglist.each do |pkg|
 puts "#{pkg[0]}, #{pkg[1]} "
end

puts "\nEXTRA PACKAGES ON ACTUAL"
comparelist.each do |pkg|
 puts "#{pkg[0]}, #{pkg[1]} "
end
