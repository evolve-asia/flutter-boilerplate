const String loginMutation = """
mutation LoginMutation(
    \$username:String!
    \$password: String!
    \$apkVersion:String
    \$fcmToken:String
    ){
    login(
      username:\$username 
      password: \$password
      apkVersion:\$apkVersion
      fcmToken:\$fcmToken) {
        token
        user: User {
            id
            fullName
            email
            phoneNumber
            firstName
            lastName
            Distributor {
                id
            }
            role: Role {
                name
                id
            }
            refreshToken
            parentUserId
        }
        Settings {
            geoFencing
            pfd
            payment
            srn
            currency
            targetDimension
            sbd
            focusedSKU
            outletCoverageTarget
            brandDistributionCoverageTarget
        }
        buName: businessUnit
        hasCheckedIn
    }
}""";
