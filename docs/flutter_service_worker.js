'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "main.dart.js": "fdc756d5e7800a4308e134c12108bd8d",
"version.json": "abb8563272681a41aa65ef70808c3454",
"assets/lib/horizontal.dart": "7182336f9179351d261474b06a9600c7",
"assets/lib/vertical.dart": "41d7190a413c98d2c64011203ba98ddb",
"assets/lib/horizontal_vertical.dart": "252b67af9d4706f706b15ce23ad1b751",
"assets/lib/listener.dart": "c6f0f5b45ef12dfa894a161b278cee29",
"assets/lib/resizable.dart": "2f9e7e28c1f132a40ae8716cd75eb085",
"assets/lib/divider_color.dart": "0dba07c34e31c963e57da58369cda41d",
"assets/lib/divider_highlighted_color.dart": "ea853b01fa17b8f0bc7018c8f8eb8c01",
"assets/lib/dashed_divider.dart": "51b5430b92a08825f7755693cd114b96",
"assets/lib/custom_dashed_divider.dart": "1099fbe46341df00765d33f4b61ff300",
"assets/lib/grooved_divider_1.dart": "0626b05cc2fdc99c3b8031f9be4f3271",
"assets/lib/custom_grooved_divider_1.dart": "71685202f01ba2b8d6072dccd186475b",
"assets/lib/grooved_divider_2.dart": "3e6fc781e23edda1643093639bb0d145",
"assets/lib/custom_grooved_divider_2.dart": "ad6331f1d478940c1f872a2618776b4d",
"assets/lib/divider_thickness.dart": "9c13fe2d74fcac6efc446f2c285b0fb3",
"assets/lib/get_started.dart": "609a64f7c3b6da9d6e0a9e88c71d6ad0",
"assets/lib/setting_weight_stateful.dart": "83db336b0063d7c748caea7d6f12cf58",
"assets/lib/setting_weight_stateless.dart": "351ee4408221b1cf6e5876312aa74ab9",
"assets/lib/minimal_weight.dart": "32e9b3430bc8b120c61f042f8c51e5a5",
"assets/lib/minimal_size.dart": "5711cc0c1b8a23f49def12988535939d",
"assets/lib/add_remove.dart": "d8efd8c6fc1624998dd6dd56007971a1",
"assets/packages/flex_color_picker/assets/opacity.png": "49c4f3bcb1b25364bb4c255edcaaf5b2",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/AssetManifest.json": "de594eb697dabd1c39afdc18a04320ea",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/NOTICES": "8b07169c098b4fec6864fde7950fb9d4",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "0e28c66c9e7f91ccf82989f7f88ce7a2",
"/": "0e28c66c9e7f91ccf82989f7f88ce7a2",
"manifest.json": "b3b4999ffcf5c4e0855e1b26263d3524"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
