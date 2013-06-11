namespace :assets do
  desc "Gera o txt contendo o vetor de valor esperado dos ativos"
  task generate_scilab_vector: :environment do

    print "Montando a vetor no arquivo txt"
    File.open(Rails.root.to_s + "/lib/scilab/assets_expret_vector.txt", "w") do |file|
      Asset.find_by_quotations(102).each do |asset|
        file.puts asset.expret
      end
    end
    puts " [ OK ]"

    puts "Finalizado com sucesso!"
  end
end