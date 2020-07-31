<apex:page standardController="Lead">
    <apex:image url="{!$Resource.welcome}"/>
    <p>
        Hello World
    </p>
    <apex:form >
        <apex:pageBlock title="Lead Details">
            <apex:outputLabel value="Name: "/>
            <apex:outputField value="{!Lead.Name}" /><br />
            <apex:outputLabel value="State: "/>
            <apex:outputField value="{!Lead.state}"/><br />
            <apex:outputLabel value="Description: "/>
            <apex:outputField value="{!Lead.description}"/>
        </apex:pageBlock>
        <apex:pageBlock >
            <apex:pageBlockTable value="{!Lead}" var="l">
                <apex:column value="{!l.name}"/>
                <apex:column value="{!l.state}"/>
                <apex:column value="{!l.description}"/>
            </apex:pageBlockTable>
        </apex:pageBlock>
    </apex:form>
</apex:page>
