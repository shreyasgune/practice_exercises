var movies = require ('./moviez');
//movies.favMovie = "Oceans 11";
//console.log("Gune's favourite movie is : "+movies.favMovie);
//gune is not setting the favourite movie but it references
//to the same module. In case of a chat room scenario, this is 
//much better for performance, memory and speed.. this is better.
var gunemovie = movies(); 
gunemovie.favMovie = "Snatch";
console.log("Gune's favourite movie is : "+gunemovie.favMovie);