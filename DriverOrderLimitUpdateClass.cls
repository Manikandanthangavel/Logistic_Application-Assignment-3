public class DriverOrderLimitUpdateClass 
{
    public static void TriggerMethod(List<Customer_Order__c> CustOrdList)
    {
        List<Id> DriverIDList=new List<Id>();
        List<Driver__c> UpdatedeDriverList=new List<Driver__c>();
        for(Customer_Order__c order:CustOrdList)
        {
            DriverIDList.add(order.Driver_Asigned__c);
        }
        List<Driver__c> driverList=[select Id,Name,	Orders_To_be_Delivered__c,Driver_ID__c from Driver__c where Id in: DriverIDList];
        List<Customer_Order__c> orderList=[select Id,Customer__c,Driver_Asigned__c from Customer_Order__c where Driver_Asigned__c in:DriverIDList];
        for(Driver__c driver:driverList)
        {
            driver.Orders_To_be_Delivered__c=orderList.size();
            UpdatedeDriverList.add(driver);
        }
        update UpdatedeDriverList;
    }
    
}