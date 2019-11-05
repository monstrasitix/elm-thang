workbox.precaching.precacheAndRoute(self.__precacheManifest);


// workbox.core.skipWaiting();
// workbox.core.clientsClaim();


workbox.routing.registerRoute(
    /https:\/\/cdnjs\.cloudflare\.com\/ajax\/libs\/font-awesome\/5\.11\.2\/css\/all\.css/,
    new workbox.strategies.StaleWhileRevalidate({
        cacheName: 'font-awesome-cache',
    }),
);


workbox.routing.registerRoute(
    /\.(?:png|gif|jpg|svg)$/,
    new workbox.strategies.StaleWhileRevalidate({
        cacheName: 'images-cache',
    }),
);

