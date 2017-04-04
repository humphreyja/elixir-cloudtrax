defmodule ExfiRouter.Router do
  use ExfiRouter.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :cloudtrax do
    #plug ExfiRouter.Cloudtrax.GenerateRa
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ExfiRouter do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    scope "/cloudtrax", Cloudtrax do
      pipe_through :cloudtrax
      resources "/sessions", SessionController
      resources "/splash_page", SplashPageController
    end
  end


  # Other scopes may use custom stacks.
  # scope "/api", ExfiRouter do
  #   pipe_through :api
  # end
end
