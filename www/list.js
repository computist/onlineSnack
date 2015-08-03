(function() {
	var app = angular.module('itemCollection', []);



	app.controller('StoreController', ['$http', function($http){
		var list = this;
		var products = [];
		$http.get('https://webster.cs.washington.edu/students/yw47/new/website/json/product.php').success(function(data){
			list.products = data;
		});
	}]);

	var items = [
		{
			name: 'A',
			description: 'some description',
			price: 10.00,
			reviews: [{
				stars: 5,
				body: "I LOVE IT",
				author: "a@gmail.com",

			}, {
				stars: 4.6,
				body: "I like it",
				author: "a@gmail.com",
			}],
			images: [
	          "http://www.ladym.com/wp-content/uploads/2012/04/ladym_millecrepe_slice_h2.jpg",
	          "images/gem-03.gif",
	          "images/gem-04.gif",
        	]
		},	

		{
			name: 'B',
			description: 'some description',
			price: 12.00,
			reviews: [{
				stars: 5,
				body: "Best ever",
				author: "ab@gmail.com",

			}, {
				stars: 4.6,
				body: "hahahaha",
				author: "b@gmail.com",
			}],
			images: [
	          "http://www.ladym.com/wp-content/uploads/2012/04/ladym_millecrepe_slice_h2.jpg",
	          "images/gem-03.gif",
	          "images/gem-04.gif",
        	]
		},
		{
			name: 'B',
			description: 'some description',
			price: 12.00,
			reviews: [{
				stars: 5,
				body: "Best ever",
				author: "ab@gmail.com",

			}, {
				stars: 4.6,
				body: "hahahaha",
				author: "b@gmail.com",
			}],
			images: [
	          "http://www.ladym.com/wp-content/uploads/2012/04/ladym_millecrepe_slice_h2.jpg",
	           "images/gem-03.gif",
	          "images/gem-04.gif",
        	]
		},
		{
			name: 'B',
			description: 'some description',
			price: 12.00,
			reviews: [{
				stars: 5,
				body: "Best ever",
				author: "ab@gmail.com",

			}, {
				stars: 4.6,
				body: "hahahaha",
				author: "b@gmail.com",
			}],
			images: [
	         "http://www.ladym.com/wp-content/uploads/2012/04/ladym_millecrepe_slice_h2.jpg",
	           "images/gem-03.gif",
	          "images/gem-04.gif",
        	]
		},
		{
			name: 'B',
			description: 'some description',
			price: 12.00,
			reviews: [{
				stars: 5,
				body: "Best ever",
				author: "ab@gmail.com",

			}, {
				stars: 4.6,
				body: "hahahaha",
				author: "b@gmail.com",
			}],
			images: [
	          "http://www.ladym.com/wp-content/uploads/2012/04/ladym_gateaumarron_whole_h.jpg",
	          "images/gem-03.gif",
	          "images/gem-04.gif",
        	]
		},
		{
			name: 'B',
			description: 'some description',
			price: 12.00,
			reviews: [{
				stars: 5,
				body: "Best ever",
				author: "ab@gmail.com",

			}, {
				stars: 4.6,
				body: "hahahaha",
				author: "b@gmail.com",
			}],
			images: [
	          "http://www.ladym.com/wp-content/uploads/2012/04/ladym_gateaumarron_whole_h.jpg",
	          
	          "images/gem-03.gif",
	          "images/gem-04.gif",
        	]
		},
		{
			name: 'B',
			description: 'some description',
			price: 12.00,
			reviews: [{
				stars: 5,
				body: "Best ever",
				author: "ab@gmail.com",

			}, {
				stars: 4.6,
				body: "hahahaha",
				author: "b@gmail.com",
			}],
			images: [
	          "http://www.ladym.com/wp-content/uploads/2012/04/ladym_gateaumarron_whole_h.jpg",
	          
	          "images/gem-03.gif",
	          "images/gem-04.gif",
        	]
		},
		{
			name: 'B',
			description: 'some description',
			price: 12.00,
			reviews: [{
				stars: 5,
				body: "Best ever",
				author: "ab@gmail.com",

			}, {
				stars: 4.6,
				body: "hahahaha",
				author: "b@gmail.com",
			}],
			images: [
	          "http://www.ladym.com/wp-content/uploads/2012/04/ladym_gateaumarron_whole_h.jpg",
	          
	          "images/gem-03.gif",
	          "images/gem-04.gif",
        	]
		},
		{
			name: 'B',
			description: 'some description',
			price: 12.00,
			reviews: [{
				stars: 5,
				body: "Best ever",
				author: "ab@gmail.com",

			}, {
				stars: 4.6,
				body: "hahahaha",
				author: "b@gmail.com",
			}],
			images: [
	          "http://www.ladym.com/wp-content/uploads/2012/04/ladym_gateaumarron_whole_h.jpg",
	          
	          "images/gem-03.gif",
	          "images/gem-04.gif",
        	]
		},
		{
			name: 'B',
			description: 'some description',
			price: 12.00,
			reviews: [{
				stars: 5,
				body: "Best ever",
				author: "ab@gmail.com",

			}, {
				stars: 4.6,
				body: "hahahaha",
				author: "b@gmail.com",
			}],
			images: [
	          "http://www.ladym.com/wp-content/uploads/2012/04/ladym_gateaumarron_whole_h.jpg",
	          
	          "images/gem-03.gif",
	          "images/gem-04.gif",
        	]
		},
		{
			name: 'B',
			description: 'some description',
			price: 12.00,
			reviews: [{
				stars: 5,
				body: "Best ever",
				author: "ab@gmail.com",

			}, {
				stars: 4.6,
				body: "hahahaha",
				author: "b@gmail.com",
			}],
			images: [
	          "http://www.ladym.com/wp-content/uploads/2012/04/ladym_gateaumarron_whole_h.jpg",
	          
	          "images/gem-03.gif",
	          "images/gem-04.gif",
        	]
		}


	];
})();