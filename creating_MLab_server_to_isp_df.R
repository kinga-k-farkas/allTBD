setwd("~/Code/InterconStudyRepr")
df <- read.csv("MLabServers.csv")
head(df,20)
df_US <- df[df$CountryCode == "US",]
df_US
nrow(df_US)  #182
unique(df_US$ASName)
# [1] <NA>                                                         
# [2] COGENT-174-CogentCommunications,US                           
# [3] ISC-AS-1280-InternetSystemsConsortium,Inc.,US                
# [4] TELIANETTeliaCarrier,SE                                      
# [5] XO-AS15-MCICommunicationsServices,Inc.d/b/aVerizonBusiness,US
# [6] GTT-BACKBONEGTT,DE                                           
# [7] LEVEL3-Level3Communications,Inc.,US                          
# [8] AS6453-TATACOMMUNICATIONS(AMERICA)INC,US                     
# [9] ZAYO-6461-ZayoBandwidth,US                                   
# [10] HURRICANE-HurricaneElectric,Inc.,US                          
# [11] INTERNAP-BLK-InternapNetworkServicesCorporation,US           
# [12] INTERNAP-2BLK-InternapNetworkServicesCorporation,US          
# [13] INTERNAP-BLOCK-4-InternapNetworkServicesCorporation,US       
# [14] VOXEL-DOT-NET-VoxelDotNet,Inc.,US                            
# [15] GOOGLEWIFI-Google,LLC,US                                     
# [16] Google Inc.                                                  
# [17]  Comcast Cable Communications, Inc.   
df_US[is.na(df_US$ASName),]
df_US <- df_US[2:nrow(df_US),]
df_US$ASNameShort <- rep("something", nrow(df_US))
as_short_names <- c("COGENT", "ISC", "TELIANET", "XO", "GTT", "LEVEL3", "TATA", "ZAYO", 
                    "HURRICANE", "INTERNAP", "VOXEL", "Google", "Comcast")
grepl( "COGENT", df_US$ASName, fixed=TRUE)
for (as in as_short_names) {
      df_US$ASNameShort[grepl( as, df_US$ASName, fixed=TRUE)] <- as
}

length(as_short_names)  #13
length(unique(df_US$AS))
for (x in as_short_names){
      print(x)
      print(unique(df_US$AS[df_US$ASNameShort == x]))
}

#write.csv(df_US, "MLab_server_US_data.csv", row.names = FALSE)
