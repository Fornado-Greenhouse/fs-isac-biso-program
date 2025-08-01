# FS-ISAC BISO Program - Claude Context

## Project Overview
This is a comprehensive Business Information Security Officer (BISO) program implementation framework consisting of 28 interconnected documents with 500+ cross-references. The framework enables organizations to implement world-class BISO programs that deliver 4-5:1 ROI through systematic business-security integration.

## Current Status
- **Version**: 2.2 (Complete Implementation Framework + Technology Strategy)
- **Total Documents**: 28 (22 core program + 6 implementation guides)
- **Implementation Timeline**: 18-24 months
- **Total Investment**: $2.9-3.6M (program + technology)
- **Expected ROI**: 4-5:1 long-term

## Key Framework Components
- **Phase 1**: Foundation (Months 1-3) - Charter, Problem Statement, Alignment Model, Stakeholder Protocols, Success Metrics
- **Phase 2**: Structure (Months 4-6) - Authority Framework, Reporting Structure, Job Descriptions, Key Processes, Support Structure  
- **Phase 3**: Strategic Value (Months 7-12) - Business Case, Risk Assessment, Executive Briefing, Strategic Alignment, etc.
- **Phase 4**: Continuous Improvement (Months 13-15) - Professional Development, Challenge Mitigation, Business Evolution

## Document Naming Convention
- **Core Program Documents**: BISOPRO-## format (e.g., BISOPRO-01_Charter.md)
- **Implementation Guides**: BISO_GUIDE-## format (e.g., BISO_GUIDE-02_Implementation.md)
- **Supporting Documents**: BISOPRO-## for specialized frameworks (e.g., BISOPRO-23_Core_Competencies_Development.md)

## Master Timeline (Critical for Timeline Consistency)
All documents must align with this master timeline:
- **Phase 1**: Months 1-3
- **Phase 2**: Months 4-6  
- **Phase 3**: Months 7-12
- **Phase 4**: Months 13-15

## Document Quality Standards

### Cross-Reference Requirements
- Every document should reference 8-15 other framework documents using relative links
- Format: `[Document Name](./FILENAME.md#specific-section)`
- Maintain cross-reference integrity when editing any document

### Wikipedia-Style Navigation
All major documents should include:
- Executive Summary with key decisions/outcomes
- Quick Navigation section for different audiences (Executives, Implementation Teams, Program Managers)
- Jump-to links within document for major sections
- Navigation section at document end for quick reference

### Financial Quantification Pattern
When adding business value or cost analysis:
- Provide specific dollar amounts with ranges (e.g., $800K-1.2M annually)
- Include industry benchmarks and peer comparisons  
- Show ROI calculations with time horizons
- Reference supporting analysis in related documents

### Visual Enhancement Standards
For complex frameworks, include:
- ASCII-based dashboard mockups and visual templates
- RACI matrices with clear accountability
- Implementation timelines with specific phases
- Process flowcharts using text-based diagrams

## Linear Issue Integration
- This project uses Linear for task management (issues like FOR-72, FOR-73, FOR-74)
- When committing changes that address Linear issues, use magic words in commit messages:

### Closing Magic Words (Complete/Close Issues)
- **close, closes, closed, closing**: Standard issue closure
- **fix, fixes, fixed, fixing**: For bug fixes
- **resolve, resolves, resolved, resolving**: For problem resolution
- **complete, completes, completed, completing**: For task completion

### Non-Closing Magic Words (Reference Without Closing)
- **ref, refs, references**: Simple reference to issue
- **part of**: Partial contribution to issue
- **related to**: Related work
- **contributes to**: Contributing work
- **toward, towards**: Work progressing toward issue resolution

## Git Workflow
- Always commit and push changes after major document updates
- Use descriptive commit messages with Linear issue references
- **Line Number Preference**: Include specific line numbers in commit messages when referencing complex document changes for precise tracking
- Example: "Completes FOR-74: Add financial quantification and navigation to BISOPRO-02 Problem Statement"
- Example with line numbers: "Completes FOR-76: Transform BISOPRO-06 Authority Framework with executive summary (lines 3-26), navigation (lines 30-55), and visual elements (lines 160-236)"

## Key Working Patterns

### Document Enhancement Approach
1. **Read complete document first** (not just 50 lines) to understand full context
2. **Identify specific gaps** against framework standards
3. **Transform systematically** with executive summary, navigation, detailed content, cross-references
4. **Maintain line-by-line tracking** of changes for user feedback
5. **Commit with Linear magic words** to link work to issues

### Multi-Document Timeline Fixes
When fixing timeline inconsistencies:
- Check both phase headers AND individual deliverable timelines
- Update all timeline references throughout each document
- Verify alignment with master timeline above
- Search for "week", "month", "year", "day" to catch all references

### Implementation Guide Standards
Implementation guides should provide:
- Step-by-step deployment instructions
- Resource requirements and timelines
- Success criteria and checkpoints
- Customization guidance for different organizations
- Technology integration requirements

## Technology Strategy
- **Focused Investment**: $400-625K (vs. original $1.2-1.8M)
- **Leverage Existing**: Use 70% of existing enterprise infrastructure
- **Custom Development**: Only for BISO-specific capabilities
- **5 Core Applications**: Risk Assessment Engine, Consultation Management, Performance Dashboard, Stakeholder Portal, Integration Engine

## Testing Commands
- **Lint**: Check if npm run lint or similar commands exist
- **Build**: Check if npm run build or similar commands exist  
- **Type Check**: Check if npm run typecheck exists
- Always run these after major changes if they exist in the project

## Success Metrics
- **Document Quality**: Comprehensive cross-referencing, executive-ready content
- **Timeline Consistency**: All documents aligned to master timeline
- **Implementation Ready**: Step-by-step guidance with specific deliverables
- **Business Value**: Clear ROI and financial quantification throughout
- **User Feedback**: Detailed line-by-line tracking as requested
- **CRITICAL REALISM REQUIREMENT**: Processes must be ACHIEVABLE in large organizations - no perfect integration assumptions, no unrealistic automation, no unified systems that don't exist. Focus on pragmatic wins within existing constraints.

## Common Pitfalls to Avoid
- Don't assume file structure - always check what exists
- Don't edit just headers - update all timeline references in document body
- Don't commit without Linear magic words when working on specific issues
- Don't create new files unless explicitly requested
- Always read full documents before making changes

## Visual Framework and Table Standards
- **PRESERVE MARKDOWN TABLES**: Never convert markdown tables to ASCII/Unicode tables - keep them as standard markdown
- **LIMIT EMOJI USAGE**: Use minimal emojis in visual frameworks - focus on simple red/yellow/green indicators (🟢🟡🔴)
- **VISUAL CONSISTENCY**: Standardize box-drawing characters using double-line borders (╔═╗║╚═╝) for dashboard-style frames
- **STATUS INDICATORS**: Use traffic light system consistently across all visual frameworks
- **TABLE FORMAT**: Always maintain pipe-separated markdown tables for data presentation

## Context for Future Sessions
This framework represents 4 phases of intensive development creating the most comprehensive BISO implementation guide available. The documents are highly interconnected and must maintain consistency across all 28 components. Focus on systematic enhancement rather than individual document optimization.