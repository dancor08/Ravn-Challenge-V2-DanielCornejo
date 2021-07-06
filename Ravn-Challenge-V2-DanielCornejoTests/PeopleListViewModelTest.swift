//
//  PeopleListViewModelTest.swift
//  Ravn-Challenge-V2-DanielCornejoTests
//
//  Created by Daniel Cornejo on 7/5/21.
//

import Combine
import XCTest
@testable import Ravn_Challenge_V2_DanielCornejo

class StarWarsPeopleProviderTests: XCTestCase {
    // MARK: Public Methods
    func testFetchFirsPeople() {
        // Given
        let service = StarWarsServiceMock()
        let viewModel = PeopleListViewModel(service: service)

        // When
        viewModel.fetchFirstPeople()

        // Then
        XCTAssertEqual(3, viewModel.people.count)
        XCTAssertFalse(viewModel.showMessage)
    }
}
