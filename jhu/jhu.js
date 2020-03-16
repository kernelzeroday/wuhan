const puppeteer = require('puppeteer');
(async () => {
  const browser = await puppeteer.launch()
  const page = await browser.newPage()
  const navigationPromise = page.waitForNavigation()
  await navigationPromise
  await page.goto('https://www.arcgis.com/home/item.html?id=c0b356e20b30490c8b8b4c7bb9554e7c#data')
  await page.setViewport({ width: 1200, height: 754 })
  const html = await page.content();
  console.log(html);
  await browser.close()
})()
