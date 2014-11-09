shop = {
  owner: new Persion "Jdd"
  animals: Animal.loadSeedData()
  featured: [ "Chupa", "Kelsey", "Flops" ]
}

petViews = (new PetView pet for pet in shop.animals)
petListView = new PetListView petViews, shop.featured
mainView = new ShopView shop.owner, petListView
mainView.render()
