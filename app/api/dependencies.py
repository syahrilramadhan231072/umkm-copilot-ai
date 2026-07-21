"""
API Dependencies
================

FastAPI dependency providers and composition root for UMKM Copilot AI.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from fastapi import Depends

from app.workflows.ai_conversation_workflow import AIConversationWorkflow
from app.services.ai_generation_service import AIGenerationService
from app.llm.response_formatter import ResponseFormatter
from app.llm.prompt_builder import PromptBuilder
from app.llm.gemini_client import GeminiClient
from app.agents.export_agent import ExportAgent
from app.agents.insight_agent import InsightAgent
from app.agents.marketing_agent import MarketingAgent
from app.agents.router_agent import RouterAgent
from app.agents.transaction_agent import TransactionAgent
from app.analytics.customer_analytics import CustomerAnalytics
from app.analytics.dashboard_analytics import DashboardAnalytics
from app.analytics.inventory_analytics import InventoryAnalytics
from app.analytics.product_analytics import ProductAnalytics
from app.analytics.sales_analytics import SalesAnalytics
from app.memory.conversation_memory import ConversationMemory
from app.repositories.business_repository import BusinessRepository
from app.repositories.conversation_repository import ConversationRepository
from app.repositories.insights_repository import InsightsRepository
from app.repositories.marketing_repository import MarketingRepository
from app.repositories.product_repository import ProductRepository
from app.repositories.transaction_repository import TransactionRepository
from app.services.business_service import BusinessService
from app.services.conversation_service import ConversationService
from app.services.insight_service import InsightService
from app.services.marketing_service import MarketingService
from app.services.product_service import ProductService
from app.services.transaction_service import TransactionService
from app.tools.analytics_tools import AnalyticsTools
from app.tools.conversation_tools import ConversationTools
from app.tools.export_tools import ExportTools
from app.tools.insight_tools import InsightTools
from app.tools.marketing_tools import MarketingTools
from app.tools.product_tools import ProductTools
from app.tools.transaction_tools import TransactionTools
from app.workflows.business_workflow import BusinessWorkflow
from app.workflows.export_workflow import ExportWorkflow
from app.workflows.insight_workflow import InsightWorkflow
from app.workflows.marketing_workflow import MarketingWorkflow
from app.workflows.transaction_workflow import TransactionWorkflow


def get_business_repository() -> BusinessRepository:
    """Return BusinessRepository dependency."""

    return BusinessRepository()


def get_product_repository() -> ProductRepository:
    """Return ProductRepository dependency."""

    return ProductRepository()


def get_transaction_repository() -> TransactionRepository:
    """Return TransactionRepository dependency."""

    return TransactionRepository()


def get_marketing_repository() -> MarketingRepository:
    """Return MarketingRepository dependency."""

    return MarketingRepository()


def get_conversation_repository() -> ConversationRepository:
    """Return ConversationRepository dependency."""

    return ConversationRepository()


def get_insights_repository() -> InsightsRepository:
    """Return InsightsRepository dependency."""

    return InsightsRepository()


def get_business_service(
    business_repository: BusinessRepository = Depends(get_business_repository),
) -> BusinessService:
    """Return BusinessService dependency."""

    return BusinessService(business_repository)


def get_product_service(
    product_repository: ProductRepository = Depends(get_product_repository),
) -> ProductService:
    """Return ProductService dependency."""

    return ProductService(product_repository)


def get_transaction_service(
    transaction_repository: TransactionRepository = Depends(
        get_transaction_repository
    ),
    product_repository: ProductRepository = Depends(get_product_repository),
) -> TransactionService:
    """Return TransactionService dependency."""

    return TransactionService(
        transaction_repository=transaction_repository,
        product_repository=product_repository,
    )


def get_marketing_service(
    marketing_repository: MarketingRepository = Depends(get_marketing_repository),
    product_repository: ProductRepository = Depends(get_product_repository),
) -> MarketingService:
    """Return MarketingService dependency."""

    return MarketingService(
        marketing_repository=marketing_repository,
        product_repository=product_repository,
    )


def get_conversation_service(
    conversation_repository: ConversationRepository = Depends(
        get_conversation_repository
    ),
) -> ConversationService:
    """Return ConversationService dependency."""

    return ConversationService(conversation_repository)


def get_insight_service(
    insights_repository: InsightsRepository = Depends(get_insights_repository),
    product_repository: ProductRepository = Depends(get_product_repository),
    transaction_repository: TransactionRepository = Depends(
        get_transaction_repository
    ),
    marketing_repository: MarketingRepository = Depends(get_marketing_repository),
) -> InsightService:
    """Return InsightService dependency."""

    return InsightService(
        insights_repository=insights_repository,
        product_repository=product_repository,
        transaction_repository=transaction_repository,
        marketing_repository=marketing_repository,
    )


def get_sales_analytics(
    transaction_repository: TransactionRepository = Depends(
        get_transaction_repository
    ),
) -> SalesAnalytics:
    """Return SalesAnalytics dependency."""

    return SalesAnalytics(transaction_repository)


def get_inventory_analytics(
    product_repository: ProductRepository = Depends(get_product_repository),
) -> InventoryAnalytics:
    """Return InventoryAnalytics dependency."""

    return InventoryAnalytics(product_repository)


def get_product_analytics(
    product_repository: ProductRepository = Depends(get_product_repository),
    transaction_repository: TransactionRepository = Depends(
        get_transaction_repository
    ),
) -> ProductAnalytics:
    """Return ProductAnalytics dependency."""

    return ProductAnalytics(
        product_repository=product_repository,
        transaction_repository=transaction_repository,
    )


def get_customer_analytics(
    transaction_repository: TransactionRepository = Depends(
        get_transaction_repository
    ),
) -> CustomerAnalytics:
    """Return CustomerAnalytics dependency."""

    return CustomerAnalytics(transaction_repository)


def get_dashboard_analytics(
    sales_analytics: SalesAnalytics = Depends(get_sales_analytics),
    inventory_analytics: InventoryAnalytics = Depends(get_inventory_analytics),
    product_analytics: ProductAnalytics = Depends(get_product_analytics),
    customer_analytics: CustomerAnalytics = Depends(get_customer_analytics),
) -> DashboardAnalytics:
    """Return DashboardAnalytics dependency."""

    return DashboardAnalytics(
        sales_analytics=sales_analytics,
        inventory_analytics=inventory_analytics,
        product_analytics=product_analytics,
        customer_analytics=customer_analytics,
    )


def get_product_tools(
    product_service: ProductService = Depends(get_product_service),
) -> ProductTools:
    """Return ProductTools dependency."""

    return ProductTools(product_service)


def get_transaction_tools(
    transaction_service: TransactionService = Depends(get_transaction_service),
) -> TransactionTools:
    """Return TransactionTools dependency."""

    return TransactionTools(transaction_service)


def get_marketing_tools(
    marketing_service: MarketingService = Depends(get_marketing_service),
) -> MarketingTools:
    """Return MarketingTools dependency."""

    return MarketingTools(marketing_service)


def get_conversation_tools(
    conversation_service: ConversationService = Depends(get_conversation_service),
) -> ConversationTools:
    """Return ConversationTools dependency."""

    return ConversationTools(conversation_service)


def get_insight_tools(
    insight_service: InsightService = Depends(get_insight_service),
) -> InsightTools:
    """Return InsightTools dependency."""

    return InsightTools(insight_service)


def get_analytics_tools(
    sales_analytics: SalesAnalytics = Depends(get_sales_analytics),
    inventory_analytics: InventoryAnalytics = Depends(get_inventory_analytics),
    product_analytics: ProductAnalytics = Depends(get_product_analytics),
    customer_analytics: CustomerAnalytics = Depends(get_customer_analytics),
    dashboard_analytics: DashboardAnalytics = Depends(get_dashboard_analytics),
) -> AnalyticsTools:
    """Return AnalyticsTools dependency."""

    return AnalyticsTools(
        sales_analytics=sales_analytics,
        inventory_analytics=inventory_analytics,
        product_analytics=product_analytics,
        customer_analytics=customer_analytics,
        dashboard_analytics=dashboard_analytics,
    )


def get_export_tools(
    analytics_tools: AnalyticsTools = Depends(get_analytics_tools),
) -> ExportTools:
    """Return ExportTools dependency."""

    return ExportTools(analytics_tools)


def get_conversation_memory(
    conversation_service: ConversationService = Depends(get_conversation_service),
) -> ConversationMemory:
    """Return ConversationMemory dependency."""

    return ConversationMemory(conversation_service)


def get_transaction_workflow(
    transaction_tools: TransactionTools = Depends(get_transaction_tools),
    analytics_tools: AnalyticsTools = Depends(get_analytics_tools),
    conversation_tools: ConversationTools = Depends(get_conversation_tools),
) -> TransactionWorkflow:
    """Return TransactionWorkflow dependency."""

    return TransactionWorkflow(
        transaction_tools=transaction_tools,
        analytics_tools=analytics_tools,
        conversation_tools=conversation_tools,
    )


def get_marketing_workflow(
    marketing_tools: MarketingTools = Depends(get_marketing_tools),
    analytics_tools: AnalyticsTools = Depends(get_analytics_tools),
    conversation_tools: ConversationTools = Depends(get_conversation_tools),
) -> MarketingWorkflow:
    """Return MarketingWorkflow dependency."""

    return MarketingWorkflow(
        marketing_tools=marketing_tools,
        analytics_tools=analytics_tools,
        conversation_tools=conversation_tools,
    )


def get_insight_workflow(
    insight_tools: InsightTools = Depends(get_insight_tools),
    analytics_tools: AnalyticsTools = Depends(get_analytics_tools),
    conversation_tools: ConversationTools = Depends(get_conversation_tools),
) -> InsightWorkflow:
    """Return InsightWorkflow dependency."""

    return InsightWorkflow(
        insight_tools=insight_tools,
        analytics_tools=analytics_tools,
        conversation_tools=conversation_tools,
    )


def get_export_workflow(
    export_tools: ExportTools = Depends(get_export_tools),
    conversation_tools: ConversationTools = Depends(get_conversation_tools),
) -> ExportWorkflow:
    """Return ExportWorkflow dependency."""

    return ExportWorkflow(
        export_tools=export_tools,
        conversation_tools=conversation_tools,
    )


def get_business_workflow(
    analytics_tools: AnalyticsTools = Depends(get_analytics_tools),
    insight_tools: InsightTools = Depends(get_insight_tools),
    conversation_tools: ConversationTools = Depends(get_conversation_tools),
) -> BusinessWorkflow:
    """Return BusinessWorkflow dependency."""

    return BusinessWorkflow(
        analytics_tools=analytics_tools,
        insight_tools=insight_tools,
        conversation_tools=conversation_tools,
    )


def get_transaction_agent(
    transaction_workflow: TransactionWorkflow = Depends(get_transaction_workflow),
    conversation_memory: ConversationMemory = Depends(get_conversation_memory),
) -> TransactionAgent:
    """Return TransactionAgent dependency."""

    return TransactionAgent(
        transaction_workflow=transaction_workflow,
        conversation_memory=conversation_memory,
    )


def get_marketing_agent(
    marketing_workflow: MarketingWorkflow = Depends(get_marketing_workflow),
    conversation_memory: ConversationMemory = Depends(get_conversation_memory),
) -> MarketingAgent:
    """Return MarketingAgent dependency."""

    return MarketingAgent(
        marketing_workflow=marketing_workflow,
        conversation_memory=conversation_memory,
    )


def get_insight_agent(
    insight_workflow: InsightWorkflow = Depends(get_insight_workflow),
    conversation_memory: ConversationMemory = Depends(get_conversation_memory),
) -> InsightAgent:
    """Return InsightAgent dependency."""

    return InsightAgent(
        insight_workflow=insight_workflow,
        conversation_memory=conversation_memory,
    )


def get_export_agent(
    export_workflow: ExportWorkflow = Depends(get_export_workflow),
    conversation_memory: ConversationMemory = Depends(get_conversation_memory),
) -> ExportAgent:
    """Return ExportAgent dependency."""

    return ExportAgent(
        export_workflow=export_workflow,
        conversation_memory=conversation_memory,
    )



def get_gemini_client() -> GeminiClient:
    """Return GeminiClient dependency."""

    return GeminiClient()


def get_prompt_builder() -> PromptBuilder:
    """Return PromptBuilder dependency."""

    return PromptBuilder()


def get_response_formatter() -> ResponseFormatter:
    """Return ResponseFormatter dependency."""

    return ResponseFormatter()


def get_ai_generation_service(
    prompt_builder: PromptBuilder = Depends(get_prompt_builder),
    response_formatter: ResponseFormatter = Depends(get_response_formatter),
) -> AIGenerationService:
    """Return AIGenerationService dependency."""

    return AIGenerationService(
        prompt_builder=prompt_builder,
        response_formatter=response_formatter,
    )


def get_ai_conversation_workflow(
    ai_generation_service: AIGenerationService = Depends(get_ai_generation_service),
    analytics_tools: AnalyticsTools = Depends(get_analytics_tools),
    conversation_tools: ConversationTools = Depends(get_conversation_tools),
    product_tools: ProductTools = Depends(get_product_tools),
) -> AIConversationWorkflow:
    """Return AIConversationWorkflow dependency."""

    return AIConversationWorkflow(
        ai_generation_service=ai_generation_service,
        analytics_tools=analytics_tools,
        conversation_tools=conversation_tools,
        product_tools=product_tools,
    )

def get_router_agent(
    transaction_agent: TransactionAgent = Depends(get_transaction_agent),
    marketing_agent: MarketingAgent = Depends(get_marketing_agent),
    insight_agent: InsightAgent = Depends(get_insight_agent),
    export_agent: ExportAgent = Depends(get_export_agent),
    business_workflow: BusinessWorkflow = Depends(get_business_workflow),
    ai_conversation_workflow: AIConversationWorkflow = Depends(get_ai_conversation_workflow),
    conversation_memory: ConversationMemory = Depends(get_conversation_memory),
) -> RouterAgent:
    """Return RouterAgent dependency."""

    return RouterAgent(
        transaction_agent=transaction_agent,
        marketing_agent=marketing_agent,
        insight_agent=insight_agent,
        export_agent=export_agent,
        business_workflow=business_workflow,
        ai_conversation_workflow=ai_conversation_workflow,
        conversation_memory=conversation_memory,
    )
