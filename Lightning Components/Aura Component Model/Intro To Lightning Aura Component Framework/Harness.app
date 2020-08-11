<!-- Our Lightning Applications start and end with the <aura:application> tags
	Lightning Applications differ from Lightning Aura components in that they are given a url so we can
	view them separately

	We frequently make use of Lightning Apps during development to preview our components while we're writing
	them. These are called harness apps and its common to name them harness.app

	Here, we extend the force:slds class in our harness app, not our top-level component b/c
	this class is automatically loaded as part of Lightning Experience, so accessing SLDS
	features requires no extra effort from us when we put a component in a Lightning page -->
<aura:application extends="force:slds">
    
    
    <!-- to instantiate a component inside of a Lightning App or another component, we use the following tag
  	it takes the form <namespace:componentName/>.
	
	The default namespace assigned to us by Salesforce is the c namespace and we're instantiating a component
 	named IntroToLACF, so we use <c:IntroToLACF/> to embed our component inside of our harness app -->
    <c:IntroToLACF/>
    <!-- <c:CompleteControl/> -->
    <!-- <c:LightningDataService/> -->
    <!-- <c:EventfulLessonsApplicationNotifier/>>
    	 <c:EventfulLessons/> -->
</aura:application>
