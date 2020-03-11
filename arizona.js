const request = require('request-promise');
const puppeteer = require('puppeteer');
(async () => {
  const browser = await puppeteer.launch({headless: false})
  const page = await browser.newPage()
  
  const navigationPromise = page.waitForNavigation()

  await page.goto('https://tableau.azdhs.gov/views/COVID-19Table/COVID-19table?:isGuestRedirectFromVizportal=y&:embed=y')
  

  await navigationPromise
  
  await page.setRequestInterception(true);

  const xRequest = await new Promise(resolve => {
    page.on('request', interceptedRequest => {
        interceptedRequest.abort();     //stop intercepting requests
        resolve(interceptedRequest);
    });
});

    await page.waitForSelector('#tabZoneId3 > .tab-zone-margin > .tab-zone-padding > .tab-tiledViewer > .tab-clip > .tab-tvYLabel > .tvimagesContainer > .tabCanvas')
  await page.click('#tabZoneId3 > .tab-zone-margin > .tab-zone-padding > .tab-tiledViewer > .tab-clip > .tab-tvYLabel > .tvimagesContainer > .tabCanvas')
  await navigationPromise

  await page.waitForSelector('#toolbar-container > .tab-toolbar > .tab-nonVizItems > .download > .tabToolbarButtonText')
  await page.click('#toolbar-container > .tab-toolbar > .tab-nonVizItems > .download > .tabToolbarButtonText')
  await navigationPromise

  await page.waitForSelector('div > div > div > .suppressClickBusting > .tabDownloadFileButton')
  await page.click('div > div > div > .suppressClickBusting > .tabDownloadFileButton')
  await navigationPromise


  const options = {
    encoding: null,
    method: xRequest._method,
    uri: xRequest._url,
    body: xRequest._postData,
    headers: xRequest._headers
}

/* add the cookies */
const cookies = await page.cookies();
options.headers.Cookie = cookies.map(ck => ck.name + '=' + ck.value).join(';');

/* resend the request */
const response = await request(options);
  
  const html = await page.content();
  console.log(response);
  await browser.close()
})()


