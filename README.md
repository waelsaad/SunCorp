This application is created for test purposes for SunCorp created by Wael

The application fetches data from a network url which receives a json file.

The application implements an MVVM design pattern which will read the json returned and renders the data in a nicely designed UI.

The UI uses a UITableView displays a list of all expensed and at the bottom displays the sum of all expenses. The expenses are ordered by
effective date in a descending order so the most recent date is at the top.

The app UI supports different device orientation.

The UI implements AutoLayouts as well as VFL (Visual Format Language) to help set up constraints programmatically

Implemented a unit test to test the network connectivity.

please run pod update. I integrated AlamoFire but didn't really use it. I wanted to show that I can integrate pod libraries...
