//
//  SearchRepositories.swift
//  GitHubRepoSearch
//
//  Created by 澤隆介 on 2021/05/23.
//

import Foundation

struct APISearchRepositories: Codable {
    let total_count: Int!
    let incomplete_results: Bool!
    let items: [Items]!
}

struct Items: Codable {
    let id: Int!
    let node_id: String!
    let name: String!
    let full_name: String!
    let owner: Owner!
    let `private`: Bool!
    let html_url: String!
    let description: String!
    let fork: Bool!
    let url: String!
    let created_at: String!
    let updated_at: String!
    let pushed_at: String!
    let homepage: String!
    let size: Int!
    let stargazers_count: Int!
    let watchers_count: Int!
    let language: String!
    let forks_count: Int!
    let open_issues_count: Int!
    let master_branch: String!
    let default_branch: String!
    let score: Int!
    let archive_url: String!
    let assignees_url: String!
    let blobs_url: String!
    let branches_url: String!
    let collaborators_url: String!
    let comments_url: String!
    let commits_url: String!
    let compare_url: String!
    let contents_url: String!
    let contributors_url: String!
    let deployments_url: String!
    let downloads_url: String!
    let events_url: String!
    let forks_url: String!
    let git_commits_url: String!
    let git_refs_url: String!
    let git_tags_url: String!
    let git_url: String!
    let issue_comment_url: String!
    let issue_events_url: String!
    let issues_url: String!
    let keys_url: String!
    let labels_url: String!
    let languages_url: String!
    let merges_url: String!
    let milestones_url: String!
    let notifications_url: String!
    let pulls_url: String!
    let releases_url: String!
    let ssh_url: String!
    let stargazers_url: String!
    let statuses_url: String!
    let subscribers_url: String!
    let subscription_url: String!
    let tags_url: String!
    let teams_url: String!
    let trees_url: String!
    let clone_url: String!
    let mirror_url: String!
    let hooks_url: String!
    let svn_url: String!
    let forks: Int!
    let open_issues: Int!
    let watchers: Int!
    let has_issues: Bool!
    let has_projects: Bool!
    let has_pages: Bool!
    let has_wiki: Bool!
    let has_downloads: Bool!
    let archived: Bool!
    let disabled: Bool!
    let license: License!
}

struct Owner: Codable {
    let id: Int!
    let login: String!
    let node_id: String!
    let avatar_url: String!
    let gravatar_id: String!
    let url: String!
    let received_events_url: String!
    let type: String!
    let html_url: String!
    let followers_url: String!
    let following_url: String!
    let gists_url: String!
    let starred_url: String!
    let subscriptions_url: String!
    let organizations_url: String!
    let repos_url: String!
    let events_url: String!
    let site_admin: Bool!
}

struct License: Codable {
    let key: String!
    let name: String!
    let url: String!
    let spdx_id: String!
    let node_id: String!
    let html_url: String!
}
