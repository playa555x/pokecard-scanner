import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../core/theme/app_theme.dart';
import '../../../shared/widgets/glass_card.dart';
import '../../../shared/models/pokemon_card.dart';
import '../../../shared/providers/card_provider.dart';

class CardDetailScreen extends ConsumerWidget {
  final String cardId;

  const CardDetailScreen({super.key, required this.cardId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardAsync = ref.watch(cardDetailProvider(cardId));

    return Scaffold(
      backgroundColor: AppColors.background,
      body: cardAsync.when(
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
        error: (e, _) => Center(
          child: Text('Fehler: $e',
              style: const TextStyle(color: AppColors.textSecondary)),
        ),
        data: (card) => _CardDetailContent(card: card),
      ),
    );
  }
}

class _CardDetailContent extends StatefulWidget {
  final PokemonCard card;

  const _CardDetailContent({required this.card});

  @override
  State<_CardDetailContent> createState() => _CardDetailContentState();
}

class _CardDetailContentState extends State<_CardDetailContent> {
  int _selectedRange = 30; // days

  @override
  Widget build(BuildContext context) {
    final card = widget.card;
    final prices = card.prices;
    final history = prices?.history ?? [];
    final trend = history.trendPercent;

    return CustomScrollView(
      slivers: [
        // Hero Header with card image
        SliverAppBar(
          expandedHeight: 380,
          pinned: true,
          backgroundColor: AppColors.background,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.bookmark_border_rounded),
              onPressed: () {/* save to collection */},
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              fit: StackFit.expand,
              children: [
                // Gradient background
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        _typeColor(card.types.firstOrNull).withOpacity(0.25),
                        AppColors.background,
                      ],
                    ),
                  ),
                ),
                // Card image
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Hero(
                      tag: 'card_${card.id}',
                      child: CachedNetworkImage(
                        imageUrl: card.imageUrlHiRes,
                        height: 280,
                        fit: BoxFit.contain,
                        placeholder: (_, __) => Container(
                          height: 280,
                          width: 200,
                          decoration: BoxDecoration(
                            color: AppColors.surfaceElevated,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        errorWidget: (_, __, ___) => const Icon(
                          Icons.broken_image_rounded,
                          color: AppColors.textMuted,
                          size: 60,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Content
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name + Set
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            card.name,
                            style: const TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -0.8,
                            ),
                          ),
                          Text(
                            '${card.set} · #${card.number}',
                            style: const TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Rarity badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: AppColors.primaryGlow,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: AppColors.primary.withOpacity(0.4)),
                      ),
                      child: Text(
                        card.rarity,
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.2),

                const SizedBox(height: 24),

                // Price Grid
                if (prices != null) ...[
                  const Text(
                    'Aktuelle Preise',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      if (prices.tcgplayer?.market != null)
                        PriceChip(
                          label: 'TCGPlayer',
                          value: prices.tcgplayer!.market!,
                          currency: '\$',
                          showTrend: true,
                          trendPercent: trend,
                        ),
                      if (prices.cardmarket?.trendPrice != null)
                        PriceChip(
                          label: 'Cardmarket',
                          value: prices.cardmarket!.trendPrice!,
                          currency: '€',
                          showTrend: true,
                          trendPercent: trend,
                        ),
                      if (prices.cardmarket?.avg7 != null)
                        PriceChip(
                          label: 'CM Ø 7T',
                          value: prices.cardmarket!.avg7!,
                          currency: '€',
                        ),
                      if (prices.cardmarket?.avg30 != null)
                        PriceChip(
                          label: 'CM Ø 30T',
                          value: prices.cardmarket!.avg30!,
                          currency: '€',
                        ),
                    ],
                  ).animate().fadeIn(delay: 200.ms),

                  const SizedBox(height: 28),

                  // Price History Chart
                  if (history.isNotEmpty) _PriceChart(
                    history: history,
                    selectedRange: _selectedRange,
                    onRangeChanged: (r) => setState(() => _selectedRange = r),
                    trendPercent: trend,
                  ).animate().fadeIn(delay: 300.ms),
                ],

                const SizedBox(height: 24),

                // Trend Analysis
                if (history.length >= 7)
                  _TrendAnalysis(history: history)
                      .animate().fadeIn(delay: 400.ms),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Color _typeColor(String? type) {
    switch (type?.toLowerCase()) {
      case 'fire': return AppColors.fire;
      case 'water': return AppColors.water;
      case 'grass': return AppColors.grass;
      case 'electric': return AppColors.electric;
      case 'psychic': return AppColors.psychic;
      case 'dragon': return AppColors.dragon;
      default: return AppColors.primary;
    }
  }
}

class _PriceChart extends StatelessWidget {
  final List<PriceHistory> history;
  final int selectedRange;
  final ValueChanged<int> onRangeChanged;
  final double trendPercent;

  const _PriceChart({
    required this.history,
    required this.selectedRange,
    required this.onRangeChanged,
    required this.trendPercent,
  });

  @override
  Widget build(BuildContext context) {
    final filtered = history.length > selectedRange
        ? history.sublist(history.length - selectedRange)
        : history;

    final spots = filtered.asMap().entries.map((e) {
      return FlSpot(e.key.toDouble(), e.value.tcgMarket);
    }).toList();

    final maxY = spots.map((s) => s.y).reduce((a, b) => a > b ? a : b) * 1.1;
    final minY = spots.map((s) => s.y).reduce((a, b) => a < b ? a : b) * 0.9;

    final lineColor = trendPercent >= 0 ? AppColors.priceUp : AppColors.priceDown;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Preisverlauf',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 13,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
            const Spacer(),
            // Range selector
            _RangeSelector(
              selected: selectedRange,
              onChanged: onRangeChanged,
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          height: 180,
          padding: const EdgeInsets.fromLTRB(0, 8, 16, 0),
          child: LineChart(
            LineChartData(
              minY: minY,
              maxY: maxY,
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                getDrawingHorizontalLine: (_) => FlLine(
                  color: AppColors.glassBorder,
                  strokeWidth: 1,
                ),
              ),
              borderData: FlBorderData(show: false),
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 44,
                    getTitlesWidget: (v, _) => Text(
                      '\$${v.toStringAsFixed(0)}',
                      style: const TextStyle(
                        color: AppColors.textMuted,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              lineTouchData: LineTouchData(
                touchTooltipData: LineTouchTooltipData(
                  getTooltipColor: (_) => AppColors.surfaceHighlight,
                  getTooltipItems: (spots) => spots.map((s) {
                    return LineTooltipItem(
                      '\$${s.y.toStringAsFixed(2)}',
                      const TextStyle(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  }).toList(),
                ),
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: spots,
                  isCurved: true,
                  curveSmoothness: 0.35,
                  color: lineColor,
                  barWidth: 2.5,
                  dotData: const FlDotData(show: false),
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        lineColor.withOpacity(0.25),
                        lineColor.withOpacity(0.0),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _RangeSelector extends StatelessWidget {
  final int selected;
  final ValueChanged<int> onChanged;

  const _RangeSelector({required this.selected, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    const ranges = [7, 30, 90];
    const labels = ['7T', '30T', '90T'];

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(ranges.length, (i) {
          final isSelected = ranges[i] == selected;
          return GestureDetector(
            onTap: () => onChanged(ranges[i]),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                labels[i],
                style: TextStyle(
                  color: isSelected ? Colors.white : AppColors.textSecondary,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _TrendAnalysis extends StatelessWidget {
  final List<PriceHistory> history;

  const _TrendAnalysis({required this.history});

  @override
  Widget build(BuildContext context) {
    final trend = history.trend;
    final pct = history.trendPercent;
    final recent7 = history.length >= 7
        ? history.sublist(history.length - 7)
        : history;
    final avgRecent = recent7.map((h) => h.tcgMarket).reduce((a, b) => a + b) /
        recent7.length;

    final (icon, color, text) = switch (trend) {
      PriceTrend.up => (Icons.trending_up_rounded, AppColors.priceUp,
          'Preis steigt — +${pct.abs().toStringAsFixed(1)}% in 30 Tagen'),
      PriceTrend.down => (Icons.trending_down_rounded, AppColors.priceDown,
          'Preis fällt — ${pct.toStringAsFixed(1)}% in 30 Tagen'),
      PriceTrend.stable => (Icons.trending_flat_rounded,
          AppColors.priceNeutral, 'Preis ist stabil'),
    };

    return GlassCard(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Trendanalyse',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  text,
                  style: TextStyle(
                    color: color,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Ø letzte 7 Tage: \$${avgRecent.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
