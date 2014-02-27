class HeroAPI < Grape::API
	prefix 'api'
  version 'v1', vendor: 'exploria'
  format :json

  resource :hero do
    desc "Return a public timeline."
    get :all do
      Hero.all
    end

		desc "Return a single hero."
    params do
      requires :id, type: Integer, desc: "Hero id."
    end
    route_param :id do
      get do
        Hero.find_by_id(params[:id])
      end

			namespace :scene do
	    	desc "Retrieve hero scene."
	    	get do
		      Hero.find_by_id(params[:id]).scene
		    end
			end

    end

  end
end