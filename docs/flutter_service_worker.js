'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"main.dart.js": "5eb475621687e75963642fbe9906507b",
"version.json": "b9f7e964daea84670ccb5a92e14845cd",
"assets/lib/examples/custom_dashed_divider.dart": "4ac2e919f0b7cc0463a8f1982675527a",
"assets/lib/examples/custom_grooved_divider_1.dart": "303f3545db31f72b86fc30bd9c1118a8",
"assets/lib/examples/custom_grooved_divider_2.dart": "7c20a5b8849b5d389a942922dfa8a694",
"assets/lib/examples/dashed_divider.dart": "b8fca8f520bc330aac916757eb652b0a",
"assets/lib/examples/divider_color.dart": "90397f465bf07f2e6e7b4ef56295f172",
"assets/lib/examples/divider_custom_widget.dart": "88d3110d5d88166a33fd6915094dbcc8",
"assets/lib/examples/divider_highlighted_color.dart": "2bedcdd1eb6b860b603569edfc9a6ba7",
"assets/lib/examples/divider_painter_from_scratch.dart": "3b216552608f10bda307405c31f09037",
"assets/lib/examples/divider_tap_gestures.dart": "d5d852658dc01126c4b80e76f1fd7d42",
"assets/lib/examples/divider_thickness.dart": "637be3729198a39ddcd38f2d2b911285",
"assets/lib/examples/example_widget.dart": "1df4999ab72e49c35f152d33bba7076b",
"assets/lib/examples/get_started.dart": "c65eff43e27daf8595b701865e86ac01",
"assets/lib/examples/grooved_divider_1.dart": "069549235764029276ae7583f573ca9e",
"assets/lib/examples/grooved_divider_2.dart": "a9907193aeacd812b45524416a79ee35",
"assets/lib/examples/horizontal.dart": "ab88fd9e8a61fa468162e3afe1bb675c",
"assets/lib/examples/horizontal_vertical.dart": "aa785b7cd49bbba4545922454a33f066",
"assets/lib/examples/listener.dart": "bfe521270d2a6f078853e94cd7606b00",
"assets/lib/examples/minimal_sizes.dart": "a371b5d33a578cf89177c26cd538c296",
"assets/lib/examples/minimal_weights.dart": "dfdb3dbc1c6e667a1765da3d634e4974",
"assets/lib/examples/programmatically.dart": "4f0b83448281f3ecc24d32007d30e9ca",
"assets/lib/examples/resizable.dart": "3392a9df8ea78227c065ada993424058",
"assets/lib/examples/setting_weight_stateful.dart": "8b08861827422fd045794324d469a8df",
"assets/lib/examples/setting_weight_stateless.dart": "350d1b7722c716bfa2ab6c6724c6d0cf",
"assets/lib/examples/vertical.dart": "29630c6674ce0858ad7e71c8e4cfb760",
"assets/lib/examples/add_remove.dart": "a2474d1af63ce30722e24f8f0af98e63",
"assets/lib/get_started/get_started_page.dart": "e6d92baa1ecb4d580196a5dd5733c92e",
"assets/lib/get_started/stateful_example.dart": "593f920a2b4334362be569affa949eac",
"assets/lib/get_started/stateless_example.dart": "d8639285f497336647551f671a437ebf",
"assets/lib/area_widget/area_widget_page.dart": "ddc403c62291e5d5ec5f932e48ba0bb2",
"assets/lib/area_widget/area_builder_attribute_example.dart": "13a1a44c376623b4e905cbc62f2a4812",
"assets/lib/area_widget/area_widget_attribute_example.dart": "3e8b45da310dee1d6cc26aada5d4597f",
"assets/lib/area_widget/builder_attribute_example.dart": "68f313f052affafbabbbc50aa0ce8d30",
"assets/lib/area_flex/area_flex_page.dart": "32f5eddc4dacaf82b64014afac53177e",
"assets/lib/area_size/area_size_page.dart": "4597aa273c8ba8a25485f5550144d7d3",
"assets/lib/axis/vertical_example.dart": "1db295f63452bcaf1f91a64be639e7e8",
"assets/lib/axis/combine_example.dart": "f2e9c72320e7f807fc67958bcfe17164",
"assets/lib/axis/horizontal_example.dart": "b6401c3b1c689226d9a07db8c67ea792",
"assets/lib/axis/axis_page.dart": "a45ee705b4d93058914cb89ff1a9ec8b",
"assets/lib/resizable/resizable_page.dart": "cee84a1aab902ba9bd9d64e1b14712f0",
"assets/lib/divider/listener/listener_page.dart": "a8fbd0508c120039d9e3bcf08fe51429",
"assets/lib/divider/tap_gestures/tap_gestures_page.dart": "83871563b5503ff62be6d76583ccfab0",
"assets/lib/divider/customization/customization.dart": "d2efd7ae4f75bada59ae3bef740350a4",
"assets/lib/divider/customization/thickness_example.dart": "201302dea74841c09a3c27bc96d0cbc9",
"assets/lib/divider/customization/color_example.dart": "4da4bf80a368b2e665b21045ef89059f",
"assets/lib/divider/customization/custom_widget_example.dart": "bb8e058dfe6806a2da5948cef6ce998f",
"assets/lib/divider/customization/highlighted_color_example.dart": "ccf6f5d06489133e41f1a5ccbd80d517",
"assets/lib/divider/customization/dashed_example.dart": "48fef797b9239b01f940609bf485b03b",
"assets/lib/divider/customization/custom_dashed_example.dart": "8dad889ba39d0063a36fe36f389466b2",
"assets/lib/divider/customization/grooved1_example.dart": "2e65b81bc877af866254460b83411dec",
"assets/lib/divider/customization/custom_grooved1_example.dart": "1d0c007fb6d4ac4ddf31d6915246f74e",
"assets/lib/divider/customization/grooved2_example.dart": "2c0394641e245d4b6f7c994c65af9f3d",
"assets/lib/divider/customization/custom_grooved2_example.dart": "1f57da96a1d94cb21d85f0510852ddf5",
"assets/lib/divider/customization/painter_from_scratch_example.dart": "ebb09af9457bb04aabc4e2431af46fa7",
"assets/lib/divider/push_mode/push_mode_page.dart": "2eb49259818260ba61d5347b649776c9",
"assets/lib/antialiasing_workaround/antialiasing_workaround.dart": "7b96a05176ad5c15071feb5c47663eec",
"assets/lib/inconsistency_resolution/zero_flex/zero_flex_page.dart": "2b566772c58de4560281f0d96dc259ed",
"assets/lib/inconsistency_resolution/size_overflow/size_overflow_page.dart": "a7d6ebb92e1c8cfafdce6dcc7d73fbb6",
"assets/lib/inconsistency_resolution/size_underflow/size_underflow_page.dart": "f001e3f9610b52879e56621c77fc4133",
"assets/packages/flex_color_picker/assets/opacity.png": "49c4f3bcb1b25364bb4c255edcaaf5b2",
"assets/packages/syntax_highlight/grammars/sql.json": "957a963dfa0e8d634766e08c80e00723",
"assets/packages/syntax_highlight/grammars/dart.json": "b533a238112e4038ed399e53ca050e33",
"assets/packages/syntax_highlight/grammars/yaml.json": "7c2dfa28161c688d8e09478a461f17bf",
"assets/packages/syntax_highlight/grammars/json.json": "e608a2cc8f3ec86a5b4af4d7025ae43f",
"assets/packages/syntax_highlight/grammars/serverpod_protocol.json": "cc9b878a8ae5032ca4073881e5889fd5",
"assets/packages/syntax_highlight/themes/dark_vs.json": "2839d5be4f19e6b315582a36a6dcd1c3",
"assets/packages/syntax_highlight/themes/light_vs.json": "8025deae1ca1a4d1cb803c7b9f8528a1",
"assets/packages/syntax_highlight/themes/light_plus.json": "2a29ad892e1f54e93062fee13b3688c6",
"assets/packages/syntax_highlight/themes/dark_plus.json": "b212b7b630779cb4955e27a1c228bf71",
"assets/fonts/MaterialIcons-Regular.otf": "e37b44034545da0e6d08739e7c45a777",
"assets/fonts/RobotoMono-Regular.ttf": "5b04fdfec4c8c36e8ca574e40b7148bb",
"assets/fonts/RobotoMono-Bold.ttf": "90190d91283189e340b2a44fe560f2cd",
"assets/fonts/RobotoMono-Italic.ttf": "0c4f4d670401518c500b1132d217fcab",
"assets/fonts/RobotoMono-BoldItalic.ttf": "ff657358db1650242d3896f4e6a17cb1",
"assets/AssetManifest.json": "e119ff0cd7a7d4a14526970b754ca46c",
"assets/FontManifest.json": "86d9cebaf06dcb175171f988e6969f98",
"assets/NOTICES": "d4e55813316d82925ceb3b259f918991",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "4afcb59980a85fde326738fcfbba4052",
"assets/AssetManifest.bin.json": "308693373d912113c9efd7cfab6aadca",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"manifest.json": "36c56deb53bbb9b5db03d53cfadc1537",
"index.html": "9de926a8ced48ecc6643e2a261a01749",
"/": "9de926a8ced48ecc6643e2a261a01749"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
