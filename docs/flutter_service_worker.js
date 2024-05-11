'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"main.dart.js": "3a09a3d81ac1887ff8d23621e46c9c17",
"version.json": "48961bf33ea02f92e4cd85df526c3211",
"assets/lib/get_started/get_started_page.dart": "e6d92baa1ecb4d580196a5dd5733c92e",
"assets/lib/get_started/stateful_example.dart": "54224051c645a29ee601f6156c2449bc",
"assets/lib/get_started/stateless_example.dart": "15b6ccb78b9053eebd52140087b62179",
"assets/lib/area_widget/area_builder_attribute_example.dart": "176eab9a05e015852ebb0c5b4bb8eaac",
"assets/lib/area_widget/area_widget_page.dart": "06bcf171031b7cabfe9fc3267699faf1",
"assets/lib/area_widget/builder_attribute_example.dart": "d9ae530349842d531b96768e34b599e3",
"assets/lib/area_flex/area_flex_page.dart": "b9ef5fe69aa5d0e08e98d05aee735968",
"assets/lib/area_size/area_size_page.dart": "44ab07dffda76f8487610aba7f8a6c9a",
"assets/lib/axis/axis_page.dart": "a45ee705b4d93058914cb89ff1a9ec8b",
"assets/lib/axis/combine_example.dart": "5cb0ca1f7c60d5721147516baa820dfc",
"assets/lib/axis/horizontal_example.dart": "429c836ebd7a315876d1bf973bcc8986",
"assets/lib/axis/vertical_example.dart": "b669661752c5599da6a20a59eb0cd187",
"assets/lib/resizable/resizable_page.dart": "177328fab6373a9a0476f34019a0a627",
"assets/lib/divider/listener/listener_page.dart": "4731a7e5ec72d94c95ab98f3a0a81cb1",
"assets/lib/divider/tap_gestures/tap_gestures_page.dart": "f7232d8d7d50f3a4fe53ba670262bd09",
"assets/lib/divider/customization/color_example.dart": "5f359162bf8985faf4c57896c871e7d0",
"assets/lib/divider/customization/custom_dashed_example.dart": "06176c729b60d72e496f45d7afacd236",
"assets/lib/divider/customization/custom_grooved1_example.dart": "f55a0fcb8bcd75a2e22f0a575bd75e12",
"assets/lib/divider/customization/custom_grooved2_example.dart": "d42a732d5c973971b5f94de277aa05ad",
"assets/lib/divider/customization/custom_widget_example.dart": "a2fca933b0b1bb5b2baa954d82f13e4d",
"assets/lib/divider/customization/customization.dart": "d2efd7ae4f75bada59ae3bef740350a4",
"assets/lib/divider/customization/dashed_example.dart": "80849b7ce8d198d269727fa9f67a510c",
"assets/lib/divider/customization/grooved1_example.dart": "6fb9aa27ece64e1f8921b3f6f7a6e1e1",
"assets/lib/divider/customization/grooved2_example.dart": "50e673bee0fdba7169f42a7e817ebb26",
"assets/lib/divider/customization/highlighted_color_example.dart": "b8c937c9a85349dcefb4cb44318f6d0d",
"assets/lib/divider/customization/painter_from_scratch_example.dart": "56e9abac025ba0154dcefdab1f686749",
"assets/lib/divider/customization/thickness_example.dart": "43f8e8a7eba38d2cc5e989ba3c0c9dfb",
"assets/lib/divider/push_mode/push_mode_page.dart": "94068a99ccadc8ab772a91d62b743436",
"assets/lib/antialiasing_workaround/antialiasing_workaround.dart": "d1c2e23e30f218667a2f9dabbf11290f",
"assets/lib/inconsistency_resolution/zero_flex/zero_flex_page.dart": "2b566772c58de4560281f0d96dc259ed",
"assets/lib/inconsistency_resolution/size_overflow/size_overflow_page.dart": "c90813a380034a585326b0c93c0169ee",
"assets/lib/inconsistency_resolution/size_underflow/size_underflow_page.dart": "59497ddec49ed522c4d12991b0905375",
"assets/fonts/RobotoMono-Regular.ttf": "5b04fdfec4c8c36e8ca574e40b7148bb",
"assets/fonts/RobotoMono-Bold.ttf": "90190d91283189e340b2a44fe560f2cd",
"assets/fonts/RobotoMono-Italic.ttf": "0c4f4d670401518c500b1132d217fcab",
"assets/fonts/RobotoMono-BoldItalic.ttf": "ff657358db1650242d3896f4e6a17cb1",
"assets/fonts/MaterialIcons-Regular.otf": "e37b44034545da0e6d08739e7c45a777",
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
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.json": "ed3786d43e498f9751c2b81785f67c47",
"assets/AssetManifest.bin": "13df29f285ff68faf7ffd48bef093cf6",
"assets/AssetManifest.bin.json": "844ab45eb9884463158a94e0d667defd",
"assets/FontManifest.json": "86d9cebaf06dcb175171f988e6969f98",
"assets/NOTICES": "d4e55813316d82925ceb3b259f918991",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"manifest.json": "36c56deb53bbb9b5db03d53cfadc1537",
"index.html": "53bc8ac5f3d0c0c919e94085e3b41d34",
"/": "53bc8ac5f3d0c0c919e94085e3b41d34"};
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
