/// A simple graphQL query with one parameter that returns a lot of data
const String getAdvertisement = r'''
  query ($id: ID!) {
    getAdvertisement(id: $id) {
      name
      id
      adTypeKey
      createdAt
      advertiserId
      campaignId
      adPlayImpressionsTotal
      adPlaysTotal
      status
      createdAt
      updatedAt
      scheduleStartDate
      scheduleEndDate
      schoolWorkflowStatus
      segments
      durationSeconds
      rejections {
        items {
          reason
        }
      }
      content {
        advertiserContent {
          id
          originalUrl
          thumbnailSmUrl
        }
      }
      marketAreas {
        items {
          adServiceMarket {
            id
            name
            description
          }
          adServiceMarketArea {
            id
            name
            description
            schoolId
            areaType
            eventId
            eventRegionId
            eventLocationId
          }
        }
      }
    }
  }
''';

/// An example of a graphQL mutation with more parameters
const String updateAdvertisement = r'''
  mutation ($id: ID!, $name: String, $status: String, $scheduleStartDate: AWSDate, $scheduleEndDate: AWSDate, $segments: [String], $durationSeconds: Float) {
    updateAdvertisement(input: {
      id: $id
      name: $name
      status: $status
      scheduleStartDate: $scheduleStartDate
      scheduleEndDate: $scheduleEndDate
      segments: $segments
      durationSeconds: $durationSeconds
    }) {
      id
      status
      updatedAt
      scheduleStartDate
      scheduleEndDate
    }
  }
''';
