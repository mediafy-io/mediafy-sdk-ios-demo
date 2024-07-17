/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */

import UIKit

fileprivate let cellID = "IntegrationCaseCell"

class IntegrationCasesViewController: UIViewController {
    
    @IBOutlet weak var integrationKindPicker: UIButton!
    @IBOutlet weak var adFormatPicker: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    private let testCases = IntegrationCaseManager.allCases
    private var displayedCases = [IntegrationCase]()
    
    private var filterText = ""
    private var currentIntegrationKind: IntegrationKind?
    private var currentAdFormat: IntegrationAdFormat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        
        displayedCases = testCases
        
        setupPickers()
    }
    
    private func setupPickers() {
        let allIntegrationKindsAction = UIAction(title: "All") { [weak self] _ in
            self?.currentIntegrationKind = nil
            self?.filterTestCases()
        }
        
        let integrationKindActions = IntegrationKind.allCases.map { integration in
            UIAction(title: integration.description) { [weak self] _ in
                self?.currentIntegrationKind = integration
                self?.filterTestCases()
            }
        }
        
        integrationKindPicker.setupPullDown(with: [allIntegrationKindsAction] + integrationKindActions)
        
        let allAdFormatsAction = UIAction(title: "All") { [weak self] _ in
            self?.currentAdFormat = nil
            self?.filterTestCases()
        }
        
        let adFormatActions = IntegrationAdFormat.allCases.map { adFormat in
            UIAction(title: adFormat.description) { [weak self] _ in
                self?.currentAdFormat = adFormat
                self?.filterTestCases()
            }
        }
        
        adFormatPicker.setupPullDown(with: [allAdFormatsAction] + adFormatActions)
    }
    
    private func filterTestCases() {
        displayedCases = testCases
            .filter { currentIntegrationKind == nil ? true : $0.integrationKind == currentIntegrationKind }
            .filter { currentAdFormat == nil ? true : $0.adFormat == currentAdFormat }
            .filter { filterText.isEmpty || $0.title.range(of: filterText, options: .caseInsensitive) != nil }
        
        tableView.reloadData()
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource

extension IntegrationCasesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        displayedCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = displayedCases[indexPath.row].title
        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let testCase = displayedCases[indexPath.row]
        
        let viewController = testCase.configurationClosure()
        viewController.view.backgroundColor = .white
        viewController.title = testCase.title
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - UISearchBarDelegate

extension IntegrationCasesViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterText = searchBar.text ?? ""
        filterTestCases()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        filterText = searchBar.text ?? ""
        filterTestCases()
        searchBar.endEditing(true)
    }
}
