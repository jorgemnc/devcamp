Rails.application.routes.draw do
 
  root to: 'paginas#home'

  #Ruta original de devise
  #devise_for :users

  #Ruta enchulada
  devise_for :users, path: "", path_names:{ sign_in: "login", sign_out:"logout", sign_up:"register"}


 #SE SUPONE QUE CUANDO SE HACEN CAMBIOS EN ROUTES HAY QUE REINICIAR RAILS SERVER 
  

  

  #PERSONALIZANDO LA RUTA SHOW PORTFOLIO:
  #PARA LA EXPLICACION VER SECCION 6, CLASE 65 https://www.udemy.com/professional-rails-5-development-course/learn/v4/t/lecture/6282322?start=0
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show_personalizado'
  #ademas de la ruta personalizada, hay que modificar el link utilizado para llegar a esta ruta en portfolios/index


  	#RUTA ORIGINAL DE RESOURCES PARA ARTICULOS
	#resources :articulos

	#RUTA PERSONALIZADA PARA RESOURCES:
  	resources :articulos do
  		member do
  			get :toggle_status
  		end
  	end

#RUTAS PERSONALIZADAS

  get 'about-me', to: 'paginas#about'
  
  get 'contact', to: 'paginas#contact'

  get "angular-items", to: "portfolios#angular"

# ASI SON LAS RUTAS ORIGINALES:
#get 'paginas/contact'


end
