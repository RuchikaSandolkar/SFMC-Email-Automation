/*
Module: Final Sendable Audience
Purpose: Combine active engagement + high value
Exclude master suppression
Target: DE_Final_Sendable_Audience
*/

SELECT DISTINCT a.Contact_Key
FROM DE_Active_Engagement a

UNION

SELECT DISTINCT h.Contact_Key
FROM DE_High_Value_Customers h

EXCEPT

SELECT s.Contact_Key
FROM DE_Master_Suppression s
