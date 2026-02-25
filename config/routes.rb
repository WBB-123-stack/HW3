Rails.application.routes.draw do
  # Root landing page
  get("/", { :controller => "places", :action => "index", :as => "root" })

  # Places routes
  get("/places", { :controller => "places", :action => "index", :as => "places" })
  get("/places/new", { :controller => "places", :action => "new", :as => "new_place" })
  get("/places/:id", { :controller => "places", :action => "show", :as => "place" })
  post("/places", { :controller => "places", :action => "create" })
  delete("/places/:id", { :controller => "places", :action => "destroy" })

  # Entries routes
  get("/entries", { :controller => "entries", :action => "index", :as => "entries" })
  get("/entries/new", { :controller => "entries", :action => "new", :as => "new_entry" })
  post("/entries", { :controller => "entries", :action => "create" })
  delete("/entries/:id", { :controller => "entries", :action => "destroy", :as => "entry" })

  # Nested Entries routes
  get("/places/:place_id/entries/new", { :controller => "entries", :action => "new", :as => "new_place_entry" })
  post("/places/:place_id/entries", { :controller => "entries", :action => "create", :as => "place_entries" })
  delete("/places/:place_id/entries/:id", { :controller => "entries", :action => "destroy" })
end
