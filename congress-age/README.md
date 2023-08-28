The notes added in the r script match the header in the Quarto document to make it easy to follow. There are some difference in the FinalProjectCongress.R script and the FinalProjectDRC.qmd Quarto document. The following changes are made in order to use certain functions like the inline R code and to keep the codes organize.
Part I: Table of Descriptive Statistics Using gtsummary

Table 1 was created in the  Quarto document to make the inline text required in the objectives. The following values: meeting107_demo, meeting107_rep, meeting107_ind were creating to make the inline text.

Part III & IV are combined in the Quarto document 


*****Disregard anything below. Just notes from the data source*****

# Congress Age
This folder contains the data behind the story [Both Republicans And Democrats Have an Age Problem](https://fivethirtyeight.com/features/both-republicans-and-democrats-have-an-age-problem/)

`congress-terms.csv` has an entry for every member of congress who served at any point during a particular congress between January 1947 and Februrary 2014.

House membership data is from the [@unitedstates project](http://theunitedstates.io/), with Congress meeting numbers added using code from [GovTrack](https://www.govtrack.us/developers/api):

* https://github.com/unitedstates/congress-legislators
* https://github.com/govtrack/govtrack.us-web/blob/master/us.py#L93

Senate membership data is mostly from the [New York Times Congress API](http://developer.nytimes.com/docs/read/congress_api) combined with birthdays from @unitedstates. (It does not include the birthday of Sen. Elmer Thomas.)

In addition, we added an `incumbent` field to each record.

