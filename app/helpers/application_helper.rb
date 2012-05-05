module ApplicationHelper
  
  def get_venue_name(fs_venue_id)
    client.venue(fs_venue_id).name
  rescue
    'connection timeout'
  end
  
  def get_venue_location(fs_venue_id)
    client.venue(fs_venue_id).location
  rescue
    ''
  end

  
  def client
    Foursquare2::Client.new(:client_id => 'QHE2JQVNOB5GWVUAGPZNAWURCQYBBYSSLY0EAVMUVXPDCUNM', :client_secret => '1LLRY4CV4TEHGRNIFRBOB23ZFUWBOEHZ2ORIOSLRQ1TGKYBS',:ssl => { :verify => false})   
  end
  
  # def vplist_as_json(venue_products,type)
    # if type='v' 
      # venue_products.collect do |venue_product|
        # {
          # :id => venue_product.id,        
          # :created_at => venue_product.created_at,
          # :updated_at => venue_product.updated_at,
          # :checkin_count => venue_product.checkin_count,
          # :most_checkined_item => venue_product.most_checkined_item,
          # :last_checkined_item => venue_product.last_checkined_item,
          # :venue_name => get_venue_name(venue_product.venue_id),
        # }
        # end.to_json
    # end
  # end
  
end
