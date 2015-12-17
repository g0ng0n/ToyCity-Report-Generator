require 'json'
path = File.join(File.dirname(__FILE__), '../data/products.json')
file = File.read(path)
products_hash = JSON.parse(file)

# Print today's date
t = Time.now()
t.strftime("The date is %m/%d/%y")
puts "--------------------------------------"
puts "Today's date #{t}";
puts "--------------------------------------"

puts "                     _            _       "
puts "                    | |          | |      "
puts " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
puts "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
puts "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
puts "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
puts "| |                                       "
puts "|_|                                       "


# For each product in the data set:
    # Print the name of the toy
    # Print the retail price of the toy
    # Calculate and print the total number of purchases
  # Calcalate and print the total amount of sales
  # Calculate and print the average price the toy sold for
  # Calculate and print the average discount based off the average sales price

# For each product in the data set:
puts "--------------------------------------"
total_sales =0;
products_hash["items"].each do |toy|
  prices = [];
  discounts = [];
  sales = 0;
  # Print the name of the toy
  puts "--------------------------------------"
  puts "*Toy's name #{toy["title"]}";
  # Print the retail price of the toy
  puts "*Retail price of toy: $#{toy["full-price"]}";

  # Calculate and print the total number of purchases
  puts "*Total purchases for the toy #{toy["title"]} are #{toy["purchases"].size}";
  total_sales = total_sales + toy["purchases"].size;

  toy["purchases"].each do |purchase|
    sales = sales + purchase["price"];
    prices.push(purchase["price"]);
    discount= ((purchase["price"].to_f/toy["full-price"].to_f))*100 ;
    discountPerc = 100 - discount
  

    discounts.push(discountPerc);
  end

  # Calcalate and print the total amount of sales
  puts "*The total amount of sales are #{sales}"
  # Calculate and print the average price the toy sold for
  avg_price=prices.inject(:+)/ prices.size;
  puts "*Average Price $#{avg_price}" ;

  # Calculate and print the average discount based off the average sales price
  avg_discount=discounts.inject(:+).to_f / discounts.size;
  avg_discount =avg_discount



  puts "*Average Discounts %#{avg_discount.round(2)}" ;

  puts "--------------------------------------"

end
  # Calcalate and print the total amount of sales
  puts "--------------------------------------"
  puts "Total Products Sales: #{total_sales}";
  puts "--------------------------------------"


	puts " _                         _     "
	puts "| |                       | |    "
	puts "| |__  _ __ __ _ _ __   __| |___ "
	puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
	puts "| |_) | | | (_| | | | | (_| \\__ \\"
	puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
	puts

# For each brand in the data set:
    # Print the name of the brand
    # Count and print the number of the brand's toys we stock
    # Calculate and print the average price of the brand's toys
    # Calculate and print the total sales volume of all the brand's toys combined
 

brands =[];
products_hash["items"].each do |toy|
  
  # I get all the Brands Names from the Products Data Structure
  # to filter below and create a new data Structure from it
  brands.push(toy["brand"]);

end

brandStructure = [];
repeatedBrandNameArray=[];
#ReInitialize the total_sales
totalSalesVolume = [];


brands.each do |brandName|
    prices = [];
    #checked if we repeated a brandName by see if the brandName String
    # Inside the repeatedBrandNameArray
    if !(repeatedBrandNameArray.include? brandName)

      #I select all the Brands from the Products Data Structure
      brandStructure = products_hash["items"].select {|item| item["brand"] == brandName}
      
      #Setup an stock counter in order to count the stock for the brands
      actualStock=0;
      puts "--------------------------------------"
      # Print the name of the brand
      puts "*Toy's Brand Name #{brandStructure[0]["brand"]}";
      sales=[];
      #I iterate over the new dataStructure of brands that was filtered before
      brandStructure.each do |brand|
        # Count the number of the brand's toys we stock
        actualStock = actualStock + brand["stock"]
        # Added the full price to the prices array in order to
        # get the average bellow
        prices.push(brand["full-price"].to_f);
        #Calculate the total sales for this brand
        brand["purchases"].each{ |p| totalSalesVolume.push(p["price"]) }
      end
      
      # Print the number of the brand's toys we stock
      puts "*Toy's Brand Stock #{actualStock}";
      
      # Calculate and print the average price the toy sold for
      avg_price=prices.inject(:+) /  prices.size;
      puts "*Average Price for the Brand #{brandStructure[0]["brand"]} - $#{avg_price.round(3)}" ;

      
    end
    repeatedBrandNameArray.push(brandName)
    
    

end
# Calculate and print the total sales volume of all the brand's toys combined
puts "--------------------------------------"
puts "*The total sales volume of all the brand's toys combined are: $ #{totalSalesVolume.inject(:+).round(2)}" ;
