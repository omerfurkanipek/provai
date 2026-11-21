// İki fonksiyonun ortak aday bağlamı: doğrulama şeması ve prompt metinleri.
import { z } from "npm:zod@3.25.76";

export const LanguageSchema = z.enum(["tr", "en"]);
export const SenioritySchema = z.enum(["intern", "junior", "mid", "senior"]);
export const StruggleSchema = z.enum(["selfIntro", "technical", "behavioral", "nerves"]);

export const CandidateSchema = z.object({
  role: z.string().trim().min(2).max(80),
  seniority: SenioritySchema,
  language: LanguageSchema,
  struggle: StruggleSchema,
});

export type Candidate = z.infer<typeof CandidateSchema>;

const SENIORITY_TEXT: Record<Candidate["seniority"], string> = {
  intern: "intern (school and personal projects)",
  junior: "junior (0-2 years of experience)",
  mid: "mid-level (2-5 years, works independently)",
  senior: "senior (5+ years, makes technical decisions)",
};

const STRUGGLE_TEXT: Record<Candidate["struggle"], string> = {
  selfIntro: "introducing themselves and telling their story",
  technical: "technical questions about concepts and design decisions",
  behavioral: "behavioral questions (conflict, mistakes, teamwork)",
  nerves: "nerves and speaking fluently without stalling",
};

export const LANGUAGE_NAME: Record<Candidate["language"], string> = {
  tr: "Turkish",
  en: "English",
};

export function describeCandidate(c: Candidate): string {
  return [
    `Target role: ${c.role}`,
    `Seniority: ${SENIORITY_TEXT[c.seniority]}`,
    `Biggest struggle: ${STRUGGLE_TEXT[c.struggle]}`,
    `Interview language: ${LANGUAGE_NAME[c.language]}`,
  ].join("\n");
}
