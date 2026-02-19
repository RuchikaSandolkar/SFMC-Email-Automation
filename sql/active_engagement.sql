/*
Module: Active Engagement Segmentation
Purpose: Identify contacts engaged in last 60 days
Target: DE_Active_Engagement
*/

SELECT 
    c.Contact_Key,
    c.Email,
    COUNT(e.Event_Type) AS Engagement_Count,
    MAX(e.Event_Date) AS Last_Engagement_Date
FROM Contact_Master c
INNER JOIN Email_Engagement e
    ON c.Contact_Key = e.Contact_Key
WHERE e.Event_Type IN ('Open','Click')
AND e.Event_Date >= DATEADD(day, -60, GETDATE())
GROUP BY c.Contact_Key, c.Email
