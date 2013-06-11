namespace :historical_quotations do
  desc "Gera o txt contendo a matriz dos preços médios dos ativos"
  task generate_scilab_matrix: :environment do

    print "Inicializando a matriz de Cotacoes Historicas"
    matrix = Asset.get_historical_quotations_matrix
    puts " [ OK ]"

    print "Montando a matriz no arquivo txt"
    File.open(Rails.root.to_s + "/lib/scilab/historical_quotations_matrix.txt", "w") do |file|
      last_index = 0
      matrix.each_with_index do |element, index|
        if last_index != index 
          file.print "\n"
          last_index = index
        end

        file.print element.to_s + " "
      end
    end
    puts " [ OK ]"

    puts "Finalizado com sucesso!"
  end
end