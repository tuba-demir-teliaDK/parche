class LatestController < ApplicationController
  
  def cheepins
    sql="select c.id cheepin_id,c.created_at cheepin_date,i.price price,vp.checkin_count cheepin_count,p.name"+
        ", pr.first_name, pr.last_name, vp.id venue_product_id, u.id user_id, vp.fs_venue_id, p.id product_id,'' venue_name,'' location " +
        "from checkins c, items i, venue_products vp, products p, users u, profiles pr where "+
        "c.item_id=i.id and i.venue_product_id=vp.id and vp.product_id=p.id and c.user_id=u.id and pr.user_id=u.id "+
        "order by c.created_at desc"
      
      @cheepins = Checkin.find_by_sql(sql)
      
      @cheepins.each_with_index do |cheepin,index| 
        @cheepins[index]["venue_name"]=get_venue_name(cheepin.fs_venue_id)
        @cheepins[index]["location"]=get_venue_location(cheepin.fs_venue_id)
      end        
      
      respond_to do |format|
        format.json { render json: @cheepins}
      end      
  end
  
  def cheepars
    @user=User.find(current_user)
     sql="select x.cheepin_id,x.cheepin_date, i.price, vp.checkin_count cheepin_count, p.name,
          pr.first_name,pr.last_name,vp.id venue_product_id, x.user_id,vp.fs_venue_id,p.id product_id, '' venue_name, '' location from (
          select f.friend_id user_id, c.id cheepin_id, max(c.created_at) cheepin_date, c.item_id
          from friendships f, checkins c
          where f.user_id=? and status=2 and c.user_id=f.friend_id  GROUP BY friend_id) x, 
          items i, venue_products vp, products p, profiles pr 
          where x.item_id=i.id and i.venue_product_id=vp.id and vp.product_id=p.id and x.user_id=pr.user_id
          order by x.cheepin_date" 
        
     @cheepars = Checkin.find_by_sql([sql,@user.id])
     
     @cheepars.each_with_index do |cheepar,index| 
       @cheepars[index]["venue_name"]=get_venue_name(cheepar.fs_venue_id)
       @cheepars[index]["location"]=get_venue_location(cheepar.fs_venue_id)
     end 
     
     respond_to do |format|
        format.json { render json: @cheepars}
      end   
  end
  
  
end
