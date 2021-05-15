class FlatsController < ApplicationController
 def index
    @flats = Flat.all

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        infoWindow: render_to_string(partial: "/flats/map_box", locals: { flat: flat })
      }
    end
  end
end
