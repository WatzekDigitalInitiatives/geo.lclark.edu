require 'blacklight/catalog'

class IndexManagerController < ApplicationController

  # Destroy a layer if user is admin and layer is found
  def destroy
    if current_user and current_user.admin
      solr = Blacklight.default_index.connection
      response = solr.get 'get', :params => { :id => params[:id] }
      if (response["doc"] == nil)
        flash[:error] = 'Sorry, the layer you are trying to delete does not exist.'
        redirect_to root_path
      else
        response = solr.delete_by_query "layer_slug_s:#{params[:id]}"
        solr.commit
        if (response["responseHeader"]["status"] == 0)
          flash[:success] = 'Layer deleted from solr.'
          redirect_to root_path
        else
          flash[:error] = 'Sorry. Not able to delete layer from solr.'
          redirect_to root_path
        end
      end
    else
      redirect_to root_path, alert: 'Sorry, only admin users have permission to delete layers'
    end
  end

end
